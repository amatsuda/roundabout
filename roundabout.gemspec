# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roundabout/version'

Gem::Specification.new do |gem|
  gem.name          = "roundabout"
  gem.version       = Roundabout::VERSION
  gem.authors       = ["Akira Matsuda"]
  gem.email         = ["ronnie@dio.jp"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'capybara', ['>= 1.0.0']
  gem.add_runtime_dependency 'rspec', ['>= 2.0.0']
  gem.add_runtime_dependency 'ruby-graphviz', ['>= 1.0.0']
end
