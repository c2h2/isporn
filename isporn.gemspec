# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'isporn/version'

Gem::Specification.new do |spec|
  spec.name          = "isporn"
  spec.version       = Isporn::VERSION
  spec.authors       = ["Yiling Cao"]
  spec.email         = ["yiling.cao@gmail.com"]
  spec.summary       = %q{Auto Porn Detection}
  spec.description   = %q{Detect if your picture(s) is pornographic by AI, powered by https://exadeep.com.}
  spec.homepage      = "https://github.com/c2h2/isporn"
  spec.license       = "MIT"
  spec.executables   = ["isporn"] 

  spec.files         = `git ls-files`.split($/)
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rest-client', '~> 1.8', '>= 1.8.0'
  spec.add_runtime_dependency 'mini_magick', '~> 4.2', '>= 4.2.9'
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
end
