# typed: strong
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class UpdateFiles
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

        sig { params(file: T.any(String, Pathname)).void }
        def parse_template(file)
        end

        sig { params(file: T.any(File, String, Pathname)).returns String }
        def mustacho(file)
        end

        sig { returns T.any(T::Array[T.untyped], String) }
        def plugins_list
        end

        sig { returns(T::Array[String]) }
        def files
        end

        sig { returns T::Array[String] }
        def template_files
        end

        sig { returns T::Array[String] }
        def repo_files
        end

        sig { returns(String) }
        def templates_path
        end

        sig { returns(T::Boolean) }
        def plugins?
        end

        sig { returns(T::Boolean) }
        def yes?
        end
      end
    end
  end
end
