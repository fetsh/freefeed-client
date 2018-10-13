# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freefeed/version'

Gem::Specification.new do |spec|
  spec.name          = 'freefeed-client'
  spec.version       = Freefeed::VERSION
  spec.authors       = ['Ilia Zemskov']
  spec.email         = ['me@fetsh.me']

  spec.summary       = 'Ruby wrapper for FreeFeed API.'
  spec.homepage      = 'https://github.com/fetsh/freefeed-client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'dry-types'
  spec.add_dependency 'dry-struct'
  spec.add_dependency 'activesupport'


  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
