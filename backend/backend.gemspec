$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "backend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "backend"
  s.version     = Backend::VERSION
  s.authors     = ["cyy"]
  s.email       = ["1018153281@qq.com"]
  s.summary     = " Summary of Backend."
  s.description = " Description of Backend."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.2"

  s.add_development_dependency "sqlite3"
end
