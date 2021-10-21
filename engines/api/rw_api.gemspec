$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rw/api/version"

Gem::Specification.new do |spec|
  spec.name        = "rw_api"
  spec.version     = Rw::Api::VERSION
  spec.authors     = ["Jaber"]
  spec.email       = ["J.donyavi@hotmail.com"]
  spec.homepage    = "http://rubywebit.com"
  spec.summary     = "Api."
  spec.description = "Description of Api."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3", ">= 6.1.3.2"
  spec.add_dependency 'rw_core' , '0.1.0'
  spec.add_development_dependency 'pg'
  spec.add_dependency 'reform', '2.6'
  spec.add_dependency 'fast_jsonapi'  
end
