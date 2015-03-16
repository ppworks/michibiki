$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "michibiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "michibiki"
  s.version     = Michibiki::VERSION
  s.authors     = ["ppworks"]
  s.email       = ["koshikawa@ppworks.jp"]
  s.homepage    = "https://github.com/ppworks/michibiki"
  s.summary     = "Auto redirector"
  s.description = "Michibiki is auto redirector if user's condition is match"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
end
