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

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "brightcontent-core", version
  s.add_dependency "brightcontent-pages", version
end
