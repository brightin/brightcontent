$:.push File.expand_path("../lib", __FILE__)

version = File.read(File.expand_path("../../VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "brightcontent-pages"
  s.version     = version
  s.email       = "developers@brightin.nl"
  s.homepage    = "http://brightin.nl"
  s.summary     = "Pages resource for brightcontent"
  s.description = "Separate pages resource for brightcontent"
  s.authors     = ["Developers at Brightin"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "brightcontent-core", version
  s.add_dependency "brightcontent-attachments", version
  s.add_dependency "awesome_nested_set", ">= 3.0.0.rc.3"
  s.add_dependency "jquery-ui-rails", ">= 2.3.0"
  s.add_dependency "the_sortable_tree", "~> 2.3.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", "~> 2.14.1"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "factory_girl_rails"
end
