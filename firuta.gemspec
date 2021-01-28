# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firuta/version'
require 'date'

Gem::Specification.new do |spec|
  spec.name          = 'firuta'
  spec.version       = Firuta::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['alebian']
  spec.email         = ['alebezdjian@gmail.com']
  spec.date          = Date.today
  spec.summary       = 'Chain collection actions easily'
  spec.description   = 'Chain collection actions easily'
  spec.homepage      = 'https://github.com/alebian/firuta'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib']
  spec.license       = 'Apache-2.0'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'byebug', '~> 11.1' if RUBY_VERSION >= '2.0.0'
  spec.add_development_dependency 'rubocop', '~> 1.9'
end
