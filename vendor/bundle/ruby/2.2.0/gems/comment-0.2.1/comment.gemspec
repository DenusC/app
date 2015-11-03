# -*- encoding: utf-8 -*-
require File.expand_path('../lib/comment/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["camel song"]
  gem.email         = ["neosoyn@gmail.com"]
  gem.description   = %q{Add comments to your model}
  gem.summary       = %q{Add comments to you model}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "comment"
  gem.require_paths = ["lib"]
  gem.version       = Comment::VERSION
end
