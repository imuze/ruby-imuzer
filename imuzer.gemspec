# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imuzer/version'

Gem::Specification.new do |spec|
  spec.name          = 'imuzer'
  spec.version       = Imuzer::VERSION
  spec.authors       = ['Yacin Bahi']
  spec.email         = ['yacin@imuze.io']
  spec.summary       = %q{Generate music with iMuze.}
  spec.description   = %q{This gem uses the iMuze (imuze.io) API to generate music. You'll need an account on iMuze.io in order to use it.}
  spec.homepage      = 'https://github.com/imuze/ruby-imuzer'
  spec.license       = 'custom'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.1.5'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rspec', '~> 3')

  spec.add_dependency('methadone', '~> 1.9.2')
  spec.add_dependency('gli', '2.13.4')
  spec.add_dependency('json', '~> 1.8.3')
  spec.add_dependency('rainbow', '~> 2.1.0')
end
