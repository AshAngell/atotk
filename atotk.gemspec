# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'atotk/version'

Gem::Specification.new do |spec|
  spec.name          = 'atotk'
  spec.version       = AtoTk::VERSION
  spec.authors       = ['Ashley Angell']
  spec.email         = ['ash@ashleyangell.com']

  spec.summary       = %q{Atotk is a toolkit for interfacing with numbers and services of the Australian Tax Department, including Tax File Numbers (TFN) and Australian Business Numbers (ABN).}
  spec.description   = %q{Atotk was created to provide an number of mechanisms to help validate and use ABNs anf TFNs as well as the ABN Business Lookup API for Ruby programmers.}
  spec.homepage      = 'https://github.com/Meroal/atotk'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'soap4r-ng', '~> 2.0'
  spec.add_development_dependency 'nokogiri', '~> 1.7'
end
