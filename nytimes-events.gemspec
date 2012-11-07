# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nytimes-events/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dylan"]
  gem.email         = ["dylandrop@gmail.com"]
  gem.description   = %q{NYTimes Events Ruby API}
  gem.summary       = %q{A Ruby wrapper for the NYTimes Events API.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nytimes-events"
  gem.require_paths = ["lib"]
  gem.version       = Nytimes::Events::VERSION
end
