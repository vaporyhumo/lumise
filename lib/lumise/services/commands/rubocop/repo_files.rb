# typed: true
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class RepoFiles
        extend Commands
        extend L

        def self.call
          command(printer: :quiet).run('rm -rf tmp/lumise-rubocop')
          command(printer: :quiet).run('mkdir -p tmp/lumise-rubocop')
          Dir.chdir 'tmp' do
            command(printer: :null).run("git clone #{l[:repo]}") do |out, err|
              logger.info err.force_encoding(Encoding::UTF_8)
            end
          end
          Dir['tmp/lumise-rubocop/**/{*,.*}'].reject do |file|
            file =~ /\.git/
          end
        end
      end
    end
  end
end
