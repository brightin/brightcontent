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

  s.add_dependency "rails", ">= 4.2.0"
  s.add_dependency "bcrypt"
  s.add_dependency "bootstrap-sass", ">= 3.4.0"
  s.add_dependency "bootstrap-wysihtml5-rails", ">= 0.3.2"
  s.add_dependency "momentjs-rails", "~> 2.5.0"
  s.add_dependency "bootstrap3-datetimepicker-rails", "~> 3.0.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "sassc-rails", ">= 2.0"
  s.add_dependency "simple_form"
  s.add_dependency "will_paginate"
  s.add_dependency "ransack", ">= 1.1"

  s.add_development_dependency "rake"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "factory_girl_rails"
end
