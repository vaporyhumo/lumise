# typed: strong
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      include L

      sig { params(_options: T.untyped).void }
      def initialize(_options)
        @plugins = T.let nil, T::Array[String]
      end

      sig { returns T::Array[String] }
      attr_reader :plugins

      sig { void }
      def execute
      end

      private

      sig { returns T::Array[String] }
      def set_plugins
      end

      sig { void }
      def verify_dependencies
      end

      sig { returns T::Array[String] }
      def prompt_plugins
      end

      sig { void }
      def update_gems
      end

      sig { void }
      def create_files
      end

      sig { void }
      def update_todo
      end
    end
  end
end
