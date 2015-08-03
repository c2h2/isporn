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
end

class String

  def isporn?
    is_porn?
  end

  def is_porn?
    temp_fn = "_temp.jpeg"
    image =  MiniMagick::Image.open(self)
    image.resize "270x270"
    image.format "jpeg"
    image.write temp_fn
    res = Isporn.exadeep_api_rest_post temp_fn
    File.delete temp_fn
    
    j=JSON.parse(res)
    j["results"].first["scores"].first["label"]
  end


  def is_porn_json
    Isporn.exadeep_api_rest_post self
  end
end
