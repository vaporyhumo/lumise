# typed: true
# frozen_string_literal: true

module Lumise
  module Commands
    class Rubocop < Lumise::Command
      class UpdateGems
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
            logger.info "#Running #{bundle_update_command}"
            bundle_update
          end
        end

        def bundle_update
          command(printer: :quiet).run(bundle_update_command)
        end

        def yes?
          if l[:update_gems].nil?
            prompt.yes? 'Update rubocop gems?', suffix: 'Yeah/nah'
          else
            l[:update_gems]
          end
        end

        def bundle_update_command
          "bundle update --conservative rubocop #{gems}"
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
