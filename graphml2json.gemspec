# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphml2json/version'

Gem::Specification.new do |spec|
  spec.name          = 'graphml2json'
  spec.version       = Graphml2Json::VERSION
  spec.authors       = ['Gregory Ostermayr']
  spec.email         = ['<gregory.ostermayr@gmail.com>']
  spec.description   = %q{Convert graphml to json for D3 use}
  spec.summary       = %q{Convert graphml to json for D3 use}
  spec.homepage      = 'https://github.com/gregors/graphml2json'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '>= 1.8.2'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency "rake", "~> 13.0"
end
