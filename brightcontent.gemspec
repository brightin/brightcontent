$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("..", __FILE__)

version = File.read(File.expand_path("../VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.name        = "brightcontent"
  s.version     = version
  s.email       = "developers@brightin.nl"
  s.homepage    = "http://brightin.nl"
  s.summary     = "Brightcontent gem"
  s.description = "Brightcontent, yet another Rails CMS / admin panel"
  s.authors     = ["Developers at Brightin"]

  s.files         = Dir['VERSION', 'README.md', 'lib/**/*']
  s.require_paths = ["lib"]

  s.add_dependency "brightcontent-core", version
  s.add_dependency "brightcontent-pages", version
  s.add_dependency "brightcontent-attachments", version

  s.add_development_dependency "rake"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "factory_girl_rails"
end
