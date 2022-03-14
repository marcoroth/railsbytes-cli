# frozen_string_literal: true

require 'lhc'
require 'json'
require 'nokogiri'
require 'uri'
require 'thor'

require 'tty-spinner'
require 'tty-box'

require_relative '../command'

module Railsbytes
  module Commands
    class Install < Railsbytes::Command
      include Thor::Actions

      def initialize(name)
        @name = name
      end

      def execute(*)
        puts ''

        spinner = TTY::Spinner.new(":spinner Searching for '#{@name}' templates on railsbytes.com", format: :bouncing_ball)
        spinner.auto_spin
        encoded_name = URI.encode_www_form_component(@name)
        url = "https://railsbytes.com/public/templates?q=#{encoded_name}&commit=Search"
        response = LHC.get(url, headers: { 'accept' => 'text/html' })
        templates = parse_response(response)
        spinner.stop

        template_id = prompt.select("\nAwesome! Found the following templates:", templates)
        template = templates.find { |t| t[:value] == template_id }
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

      private

      def parse_response(response)
        Nokogiri::HTML(response.body).css('div.container div.grid > a').map do |grid_item|
          name = grid_item.css('h4').text
          href = grid_item[:href]
          key = href.split("/").last
          { name: name, value: key }
        end
      end
    end
  end
end
