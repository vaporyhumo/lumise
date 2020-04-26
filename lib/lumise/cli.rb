# typed: false
# frozen_string_literal: true

require 'thor'

module Lumise
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'lumise version'
    def version
      require_relative 'version'
      $stdout.puts "v#{Lumise::VERSION}"
    end
    map %w[--version -v] => :version

    desc 'rubocop', 'Set up rubocop'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def rubocop(*)
      if options[:help]
        invoke :help, ['rubocop']
      else
        execute_rubocop
      end
    end

    private

    def execute_rubocop
      require_relative 'commands/rubocop'
      Lumise::Commands::Rubocop.new(options).execute
    end
  end
end
