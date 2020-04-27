# typed: strong
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class UpdateGems
        include Commands
        include L

        sig { params(plugins: T::Array[String]).void }
        def self.call(plugins:)
        end

        sig { params(plugins: T::Array[String]).void }
        def initialize(plugins:)
          @plugins = plugins
        end

        private

        sig { returns T::Array[String] }
        attr_reader :plugins

        sig { void }
        def perform
        end

        sig { void }
        def bundle_update
        end

        sig { returns T::Boolean }
        def yes?
        end

        sig { returns String }
        def bundle_update_command
        end

        sig { returns String }
        def gems
        end
      end
    end
  end
end
