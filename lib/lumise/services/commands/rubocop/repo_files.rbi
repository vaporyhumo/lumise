# typed: strong
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class RepoFiles
        include Commands
        include L

        sig { returns T::Array[String] }
        def self.call
        end

        sig { returns T::Array[String] }
        def call
        end

        private

        sig { returns T::Array[String] }
        def rubocop_files
        end

        sig { void }
        def clone_repo_onto_tmp_lumise
        end

        sig { returns String }
        def git_clone_command
        end

        sig { returns String }
        def repo
        end

        sig { returns String }
        def branch
        end

        sig { void }
        def recreate_tmp_lumise
        end

        sig { void }
        def remove_tmp_lumise
        end
      end
    end
  end
end
