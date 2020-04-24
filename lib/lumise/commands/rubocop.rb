# typed: false
# frozen_string_literal: true

require_relative '../command'

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      def initialize(options)
        @options = options
      end

      def execute(_input: $stdin, _output: $stdout)
        which('curl')
        files.each do |filename|
          create_it(filename)
        end
      end

      def create_it(filename)
        generator.create_file filename, curl_it(filename)
      end

      def curl_it(
        filename, branch: 'master', repo: 'lumise-rubocop', user: 'vaporyhumo'
      )
        command(printer: :null).run(<<~CURL).out
          curl https://raw.githubusercontent.com/#{user}/#{repo}/#{branch}/#{filename}
        CURL
      end

      private

      def files
        %w[.rubocop .rubocop.yml .rubocop_todo.yml .rubocop_local.yml
           .rubocop_global.yml .rubocop_project.yml .rubocop_raw.yml]
      end
    end
  end
end
