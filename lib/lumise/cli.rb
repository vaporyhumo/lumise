# typed: strict
# frozen_string_literal: true

module Lumise
  class CLI < Thor
    Error = Class.new(StandardError)

    desc 'version', 'lumise version'
    def version
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
      Lumise::Commands::Rubocop.new(options).execute
    end
  end
end
