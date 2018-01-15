lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nib/crypt/version'

Gem::Specification.new do |s|
  s.name          = 'nib-crypt'
  s.version       = Nib::Crypt::VERSION
  s.authors       = ['John Allen']
  s.email         = ['john@threedogconsulting.com']

  s.summary       = 'An encryption plugin for Nib'
  s.description   = 'An encryption plugin for Nib'
  s.homepage      = 'https://github.com/technekes/nib-crypt'
  s.license       = 'MIT'

  s.files = Dir['lib/**/*.rb']
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'nib-crypt'

  s.add_runtime_dependency('nib', '>= 2.0')

  s.add_development_dependency('codeclimate-test-reporter', '~> 1.0.7')
  s.add_development_dependency('guard')
  s.add_development_dependency('guard-rspec')
  s.add_development_dependency('guard-rubocop')
  s.add_development_dependency('pry')
  s.add_development_dependency('rake')
  s.add_development_dependency('simplecov')
end
