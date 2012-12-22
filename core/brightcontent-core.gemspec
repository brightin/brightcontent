$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../../VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "brightcontent-core"
  s.version     = version
  s.email       = "developers@brightin.nl"
  s.homepage    = "http://brightin.nl"
  s.summary     = "Brightcontent core"
  s.description = "Brightcontent core"
  s.authors     = ["Developers at Brightin"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "jquery-rails"
  s.add_dependency "bcrypt-ruby"
  s.add_dependency "inherited_resources"
  s.add_dependency "simple_form"
  s.add_dependency "will_paginate"
  s.add_dependency "bootstrap-wysihtml5-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "factory_girl_rails"
end
