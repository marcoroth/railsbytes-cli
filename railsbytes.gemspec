# frozen_string_literal: true

require_relative 'lib/railsbytes/version'

Gem::Specification.new do |spec|
  spec.name          = 'railsbytes'
  spec.version       = Railsbytes::VERSION
  spec.authors       = ['Marco Roth']
  spec.email         = ['marco.roth@intergga.ch']
  spec.summary       = 'CLI to apply Railsbytes templates to your Rails application'
  spec.description   = spec.summary
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

  spec.add_dependency 'lhc', '= 16.0.0.pre.pro2162.2'
  spec.add_dependency 'thor', '~> 1.0'
  spec.add_dependency 'tty-box', '~> 0.5'
  spec.add_dependency 'tty-command', '~> 0.9'
  spec.add_dependency 'tty-prompt', '~> 0.21'
  spec.add_dependency 'tty-spinner', '~> 0.9'
  spec.add_dependency 'nokogiri', '~> 1.13'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 0.84'
end
