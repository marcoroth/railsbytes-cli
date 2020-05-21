# frozen_string_literal: true

require 'lhc'
require 'json'
require 'thor'

require 'tty-spinner'
require 'tty-box'

require_relative '../command'

module Railsbytes
  module Commands
    class Install < Railsbytes::Command
      include Thor::Actions

      TEMPLATES = [
        { value: 'X8Bsjx', name: 'devise' },
        { value: 'x9Qsqx', name: 'bootstrap' },
        { value: 'VMysyV', name: 'stimulus_reflex' },
        { value: 'z5OsqV', name: 'tailwind' }
      ].freeze

      def initialize(name)
        @name = name
      end

      def execute(*)
        puts ''

        spinner = TTY::Spinner.new(":spinner Searching for '#{@name}' templates on railsbytes.com", format: :bouncing_ball)
        spinner.auto_spin
        sleep 0.5
        spinner.stop

        template_id = prompt.select("\nAwesome! Found the following templates:", TEMPLATES)
        template = TEMPLATES.find { |t| t[:value] == template_id }
        script = LHC.get("https://railsbytes.com/script/#{template_id}").body

        puts ''
        print TTY::Box.info(
          script,
          title: {
            top_left: "Template: #{template[:name]}",
            bottom_right: "id: #{template_id}"
          },
          style: {
            fg: :white,
            bg: :bright_black,
            border: {
              fg: :white,
              bg: :bright_black
            }
          }
        )
        puts ''

        install = prompt.yes?("Do you want apply this template to your Rails app '#{Dir.pwd}'?", default: false)

        return unless install

        command.run("rails app:template LOCATION=\"https://railsbytes.com/script/#{template_id}\"")
      rescue TTY::Reader::InputInterrupt
        puts "\nAborting..."
        exit(0)
      end
    end
  end
end
