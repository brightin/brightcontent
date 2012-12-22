$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("..", __FILE__)

require "core/lib/brightcontent/core/version"

Gem::Specification.new do |s|
  s.name        = "brightcontent"
  s.version     = Brightcontent::Core::VERSION
  s.email       = "developers@brightin.nl"
  s.homepage    = "http://brightin.nl"
  s.summary     = "Brightcontent gem"
  s.description = "Brightcontent, yet another Rails CMS / admin panel"
  s.authors     = ["Developers at Brightin"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "brightcontent-core"
  s.add_dependency "brightcontent-pages"
end
