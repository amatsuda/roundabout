# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roundabout/version'

Gem::Specification.new do |gem|
  gem.name          = "roundabout"
  gem.version       = Roundabout::VERSION
  gem.authors       = ["Akira Matsuda"]
  gem.email         = ["ronnie@dio.jp"]
  gem.description   = 'A Rails Engine that generates a page transition diagram for your Rails app from request specs'
  gem.summary       = 'A Rails Engine that generates a page transition diagram for your Rails app from request specs'
  gem.homepage      = 'https://github.com/amatsuda/roundabout'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'capybara', ['>= 1.0.0']
  gem.add_runtime_dependency 'ruby-graphviz', ['>= 1.0.0']
end
