# typed: false
# frozen_string_literal: true

require_relative 'lib/lumise/version'

Gem::Specification.new do |spec|
  spec.name          = 'lumise'
  spec.version       = Lumise::VERSION

  spec.authors       = ['vaporyhumo']
  spec.email         = ['roanvilina@gmail.com']

  spec.summary       = 'Stardard initializers for other gems.'
  spec.description = <<~DESC
    Standardize your team's gems configurations.
  DESC
  spec.license       = 'Unlicense'

  spec.homepage      = 'https://github.com/vaporyhumo/lumise'
  spec.metadata = {
    'bug_tracker_uri' => spec.homepage + '/issues',
    'changelog_uri' => spec.homepage + '/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/lumise',
    'source_code_uri' => spec.homepage
  }

  spec.files         = Dir['lib/**/{*,.*}']
  spec.bindir        = 'exe'
  spec.executables   = ['lumise']

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_dependency 'mustache'
  spec.add_dependency 'thor',        '~> 1.0'
  spec.add_dependency 'tty-command', '~> 0.9'
  spec.add_dependency 'tty-file',    '~> 0.8'
  spec.add_dependency 'tty-logger',  '~> 0.3'
  spec.add_dependency 'tty-which',   '~> 0.4'
end
