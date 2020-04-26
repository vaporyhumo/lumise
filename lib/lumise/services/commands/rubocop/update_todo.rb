# typed: true
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class UpdateTodo
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
            logger.info "#Running #{autogen_command}"
            bundle_update
          end
        end

        def bundle_update
          command(printer: :quiet).run autogen_command
        end

        def yes?
          if l[:update_todo].nil?
            prompt.yes? 'Update rubocop TODO file?', suffix: 'Yeah/nah'
          else
            l[:update_todo]
          end
        end

        def autogen_command
          <<~AUTOGEN
            bundle exec rubocop --auto-gen-config --auto-gen-only-exclude \
            --exclude-limit $(bundle exec rubocop -L | wc -l)
          AUTOGEN
        end

        def gems
          plugins.map do |plugin|
            'rubocop-' + plugin
          end.join(' ')
        end
      end
    end
  end
end
