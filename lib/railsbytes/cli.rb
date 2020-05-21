# frozen_string_literal: true

require 'thor'

module Railsbytes
  class CLI < Thor
    include Thor::Actions

    Error = Class.new(StandardError)

    desc 'version', 'railsbytes version'
    def version
      require_relative 'version'
      puts "v#{Railsbytes::VERSION}"
    end
    map %w[--version -v] => :version

    desc 'install NAME', 'Apply a template to your rails app'
    def install(name)
      require_relative 'commands/install'
      @config = Railsbytes::Commands::Install.new(name).execute
    end
  end
end
