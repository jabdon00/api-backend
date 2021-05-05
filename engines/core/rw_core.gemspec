$:.push File.expand_path("../lib", __FILE__)
require "rw/core/version"

Gem::Specification.new do |spec|
  spec.name        = "rw_core"
  spec.version     = Rw::Core::VERSION
  spec.authors     = ["Jaber"]
  spec.license     = "MIT"
  spec.summary     = 'Do Core works'
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.test_files = Dir[""]

  spec.add_dependency "rails", "~> 6.1.3", ">= 6.1.3.2"
  spec.add_development_dependency 'pg'
  spec.add_dependency 'devise'
end
