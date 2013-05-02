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
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1"
  s.add_dependency 'jquery-rails', '~> 2.1.4'
  s.add_dependency 'acts_as_tree', '~>1.1'
  s.add_dependency 'acts_as_list'
  s.add_dependency 'will_paginate', '~> 3.0'
  s.add_dependency 'RedCloth'
  s.add_dependency 'paperclip'
  s.add_dependency 'bcrypt-ruby', '~> 3.0'
  s.add_dependency 'haml', '~> 3.1'
  
  # bug in rails, fixed in the 3.2 branch
  # s.add_dependency 'bourbon'

  s.add_development_dependency "sqlite3"
end
