# typed: false
# frozen_string_literal: true

require_relative 'lib/lumise/version'

Gem::Specification.new do |spec|
  spec.name          = 'lumise'
  spec.license       = 'Unlicense'
  spec.version       = Lumise::VERSION
  spec.authors       = ['vaporyhumo']
  spec.email         = ['roanvilina@gmail.com']

  spec.summary       = 'Stardart initializers for other gems.'
  spec.homepage      = 'https://google.com'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://google.com'
  spec.metadata['changelog_uri'] = 'https://google.com'

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir[
    'lib/**/*', 'exe/**/*', 'bin/**/*', 'Gemfile*', 'Rakefile', 'README.md',
    'UNLICENSE.txt'
  ]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor',        '~> 1.0'
  spec.add_dependency 'tty-command', '~> 0.9'
  spec.add_dependency 'tty-file',    '~> 0.8'
  spec.add_dependency 'tty-which',   '~> 0.4'
end
