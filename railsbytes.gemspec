# frozen_string_literal: true

require_relative 'lib/railsbytes/version'

Gem::Specification.new do |spec|
  spec.name          = 'railsbytes'
  spec.version       = Railsbytes::VERSION
  spec.authors       = ['Marco Roth']
  spec.email         = ['marco.roth@intergga.ch']
  spec.summary       = 'Write a short summary, because RubyGems requires one.'
  spec.description   = 'Write a longer description or delete this line.'
  spec.homepage      = 'https://github.com/marcoroth/railsbytes'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/marcoroth/railsbytes'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'lhc'
  spec.add_dependency 'thor'
  spec.add_dependency 'tty-box'
  spec.add_dependency 'tty-command'
  spec.add_dependency 'tty-prompt'
  spec.add_dependency 'tty-spinner'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
end
