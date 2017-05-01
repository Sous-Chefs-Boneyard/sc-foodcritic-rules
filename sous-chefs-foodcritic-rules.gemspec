# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'sous-chefs-foodcritic-rules'
  spec.version       = '0.0.1'
  spec.authors       = ['Sous Chefs']
  spec.email         = ['dan.webb@damacus.io']
  spec.description   = 'Sous Chefs foodcritic rules'
  spec.summary       = 'Sous Chefs foodcritic rules'
  spec.homepage      = 'https://sous-chefs.org'
  spec.license       = 'Apache'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'foodcritic'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
