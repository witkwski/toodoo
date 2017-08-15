# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = 'toodoo'
  spec.version     = '0.1.1'
  spec.summary     = 'petite command line todo list'
  spec.description = 'minimalistic todo utility for your command line'
  spec.authors     = ['Anton Witkowski']
  spec.email       = 'antnwtkwsk@gmail.com'
  spec.homepage    = 'https://github.com/witkwski/toodoo'
  spec.license     = 'MIT'

  spec.files         = `git ls-files`.strip.split("\n")
  spec.require_paths = ['lib']
  spec.executables << 'td'

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_development_dependency 'rspec', '>= 3.6.0'
  spec.add_development_dependency 'pry', '>= 0.10.4'
  spec.add_development_dependency 'rubocop', '0.39.0'
end
