# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nytimes-events/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dylan"]
  gem.email         = ["dylandrop@gmail.com"]
  gem.description   = %q{NYTimes Events Ruby API}
  gem.summary       = %q{A Ruby wrapper for the NYTimes Events API.}
  gem.homepage      = "https://github.com/dylandrop/nytimes-events"

  gem.add_development_dependency "rspec"
  gem.add_dependency "rest-client", ">0"
  gem.add_dependency "json", ">0"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nytimes-events"
  gem.require_paths = ["lib"]
  gem.version       = Nytimes::Events::VERSION
end
