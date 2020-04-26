# typed: true
# frozen_string_literal: true

require 'lumise'
require_relative '../command'
require_relative '../l'

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      include Lumise::L

      def initialize(options)
        @options = options
      end

      def execute(_input: $stdin, _output: $stdout)
        verify_dependencies
        ask_for_plugins
        ask_for_update
        create_files
        ask_for_todo
      end

      private

      def create_files
        files.each do |filename|
          create_it(filename)
        end
      end

      def verify_dependencies
        verify_curl
      end

      def ask_for_plugins
        choices = %w[performance rails rspec sorbet]
        @plugins = prompt.multi_select('Which plugins are you using?', choices)
      end

      def ask_for_update
        if prompt.yes? 'Would you like to update rubocop?'
          command(printer: :quiet).run('bundle update --conservative rubocop')
        end
      end

      def ask_for_todo
        if prompt.yes? 'Would you like to run rubocop auto-gen?'
          command(printer: :quiet).run auto_gen_command
        end
      end

      def auto_gen_command
        <<~AUTOGEN
          bundle exec rubocop --auto-gen-config --auto-gen-only-exclude \
          --exclude-limit $(bundle exec rubocop -L | wc -l)
        AUTOGEN
      end

      def verify_curl
        command(printer: :null).run('curl -V') do |out, err|
          handle_curl(err, out)
        end
      rescue Errno::ENOENT
        logger.error "Couldn't find curl"
      end

      def handle_curl(err, out)
        if err
          raise Errno::ENOENT
        else
          logger.success out.scan(/curl \d*\.\d*\.\d*/)
        end
      end

      def create_it(filename)
        file = curl_it filename
        generator.create_file filename, file, force: l.force
      end

      def curl_it(filename, branch: l.branch, repo: l.repo, user: l.user)
        command(printer: :null).run(<<~CURL).out
          curl #{github}/#{user}/#{repo}/#{branch}/#{filename}
        CURL
      end

      def github
        'https://raw.githubusercontent.com'
      end

      def files
        %w[.rubocop .rubocop.yml .rubocop_todo.yml .rubocop_local.yml
           .rubocop_global.yml .rubocop_project.yml .rubocop_raw.yml]
      end
    end
  end
end
