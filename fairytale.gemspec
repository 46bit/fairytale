# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fairytale/version'

Gem::Specification.new do |gem|
  gem.name          = "fairytale"
  gem.version       = Fairytale::VERSION
  gem.authors       = ["Michael Mokrysz"]
  gem.email         = ["hi@46bit.com"]
  gem.description   = "A programmer's static site compiler."
  gem.summary       = "Fairytale is a Sinatra-reminiscent static site compilation tool, perfect for when you want to build something exactly how you like it."
  gem.homepage      = "http://rubygems.org/gems/fairytale"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = ["fairytale"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "thor", "~> 0.16.0"
  gem.add_dependency "json", "~> 1.7.5"
  gem.add_dependency "tilt", "~> 1.3.3"
  gem.add_dependency "sanitize", "~> 2.0.3"
end
