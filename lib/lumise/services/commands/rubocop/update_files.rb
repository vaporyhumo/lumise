# typed: true
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class UpdateFiles
        include Commands
        include L

        def self.call(plugins:)
          new(plugins: plugins).send :perform
        end

        def initialize(plugins:)
          @plugins = plugins
        end

        private

        attr_reader :plugins

        def perform
          if yes?
            files.each(&method(:parse_template))
          end
        end

        def parse_template(file)
          generator.create_file File.basename(file), mustacho(file), force: l[:force]
        end

        def mustacho(file)
          Mustache.render File.read(file),
                          require: plugins?, plugins: plugins_list,
                          rspec: plugins.include?('rspec'),
                          sorbet: plugins.include?('sorbet')
        end

        def plugins_list
          plugins.map do |plugin|
            "  - rubocop-#{plugin}"
          end.join("\n")
        rescue NoMethodError
          []
        end

        def files
          if l[:repo]
            repo_files
          else
            template_files
          end
        end

        def template_files
          Dir[templates_path + '**/{*,.*}'].reject do |file|
            file.scan(/\.$/).first
          end
        end

        def repo_files
          RepoFiles.call
        end

        def templates_path
          File.expand_path('../../../templates/rubocop', __dir__)
        end

        def plugins?
          !plugins.nil?
        end

        def yes?
          if l[:update_files].nil?
            prompt.yes? 'Update .rubocop files?', suffix: 'Yeah/nah'
          else
            l[:update_files]
          end
        end
      end
    end
  end
end
