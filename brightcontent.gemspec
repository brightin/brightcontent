$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "brightcontent/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "brightcontent"
  s.version     = Brightcontent::VERSION
  s.authors     = ["Developers at Brightin"]
  s.email       = ["developers@brightin.nl"]
  s.homepage    = "http://brightin.nl"
  s.summary     = "Brightcontent gem"
  s.description = "Brightcontent, yet another rails CMS / admin panel"


  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  #s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
