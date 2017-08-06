Gem::Specification.new do |spec|
  spec.name = 'toodoo'
  spec.version     = '0.0.0'
  spec.summary     = 'command line todo list'
  spec.description = 'command line todo list'
  spec.authors     = ['Anton Witkowski']
  spec.email       = 'antnvtkvsk@live.ru'
  spec.files       = 'lib/toodoo.rb'
  spec.license     = 'MIT'
  spec.executables << 'td'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
end
