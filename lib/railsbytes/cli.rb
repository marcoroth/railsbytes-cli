# frozen_string_literal: true

require 'thor'

module Railsbytes
  class CLI < Thor
    include Thor::Actions

    desc 'version', 'railsbytes version'
    def version
      require_relative 'version'
      puts "v#{Railsbytes::VERSION}"
    end
    map %w[--version -v] => :version

    desc 'install NAME', 'Apply a Railsbytes template to your Rails app'
    def install(name)
      require_relative 'commands/install'
      Railsbytes::Commands::Install.new(name).execute
    end
  end
end
