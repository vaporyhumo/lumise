# typed: strict
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class RepoFiles
        include Commands
        include L

        def self.call
          new.call
        end

        def call
          remove_tmp_lumise
          recreate_tmp_lumise
          clone_repo_onto_tmp_lumise
          rubocop_files
        end

        private

        def rubocop_files
          Dir['tmp/lumise/rubocop/**/{*,.*}']
        end

        def clone_repo_onto_tmp_lumise
          command(printer: :null).run(git_clone_command) do |_out, err|
            logger.info err.force_encoding(Encoding::UTF_8)
          end
        end

        def git_clone_command
          "git clone --single-branch --branch #{branch} #{repo} tmp/lumise"
        end

        def repo
          T.must(l.repo)
        end

        def branch
          l.branch || 'master'
        end

        def recreate_tmp_lumise
          command(printer: :quiet).run('mkdir -p tmp/lumise')
        end

        def remove_tmp_lumise
          command(printer: :quiet).run('rm -rf tmp/lumise')
        end
      end
    end
  end
end
