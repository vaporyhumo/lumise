# typed: strict
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      include L

      def initialize(_options)
        verify_dependencies
        @plugins = set_plugins
      rescue Which::Curl::CurlError
        logger.error 'Please install curl'
      end

      attr_reader :plugins

      def execute
        update_gems
        create_files
        update_todo
      end

      private

      def set_plugins
        l.plugins || prompt_plugins
      end

      def verify_dependencies
        Which::Curl.call
      end

      def prompt_plugins
        choices = %w[performance rails rspec sorbet]

        prompt.multi_select 'Which plugins are you using?' do |menu|
          menu.default 1, 3
          menu.choices choices
        end
      end

      def update_gems
        UpdateGems.call plugins: plugins
      end

      def create_files
        UpdateFiles.call plugins: plugins
      end

      def update_todo
        UpdateTodo.call plugins: plugins
      end
    end
  end
end
