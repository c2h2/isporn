require 'rest-client'
require 'mini_magick'
require 'json'

module Isporn
  def self.exadeep_api_rest_post images
    debug = false

    if images.class == String
      images=[images]
    elsif images.class == Array
    else
      return nil
    end
    host = "https://exadeep.com"
    RestClient.log = 'stdout' if debug
    image_array = images.collect{|image| File.new(image, 'rb') }
    request = RestClient::Request.new(
      :method => :post,
      :url =>  "#{host}/api/v1",
      :payload => {
        :api_key => 'exadeep_ruby_demo_key',
        :multipart => true,
        "images" => image_array
      })
    request.execute
  end

  def self.exadeep_api_rest_urls urls
    debug = false

    if urls.class == String
      urls=[urls]
    elsif urls.class == Array
    else
      return nil
    end
    host = "https://exadeep.com"
    RestClient.log = 'stdout' if debug
    request = RestClient::Request.new(
      :method => :post,
      :url =>  "#{host}/api/v1",
      :payload => {
        :api_key => 'exadeep_ruby_demo_key',
        :urls => urls
      })
    request.execute
  end
end

class String
  def isporn?
    is_porn?
  end

  def is_porn?
    test_url = self
    if (test_url =~ /\A#{URI::regexp}\z/)==0 and test_url.length<4096
      res = Isporn.exadeep_api_rest_urls [self]  
    else
      temp_fn = "_temp.jpeg"
      image =  MiniMagick::Image.open(self)
      image.resize "270x270"
      image.format "jpeg"
      image.write temp_fn
      res = Isporn.exadeep_api_rest_post temp_fn
      File.delete temp_fn
    end    

    j=JSON.parse(res)
    j["results"].first["scores"].first["label"]
  end

  def is_porn_json
    Isporn.exadeep_api_rest_post self
  end
end
