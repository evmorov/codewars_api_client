# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codewars_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'codewars_api'
  spec.version       = CodewarsApi::VERSION
  spec.authors       = ['Evgeny Morozov']
  spec.email         = ['evmorov@gmail.com']

  spec.summary       = 'Simple Ruby wrapper for the Codewars API '
  spec.homepage      = 'https://github.com/evmorov/codewars_api_client'

  spec.files         = `git ls-files -z`.split("\x0")
                       .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.licenses      = ['MIT']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_development_dependency 'webmock', '~> 1.21.0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'andand', '~> 1.3.3'
end
