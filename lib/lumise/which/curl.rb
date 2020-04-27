# typed: strict
# frozen_string_literal: true

module Lumise
  module Which
    module Curl
      CurlError = Class.new(Error)

      class << self
        def call
          if curl_exists?
            curl_v
          else
            raise CurlError, "Couldn't find curl"
          end
        end

        private

        def curl_exists?
          TTY::Which.exist? 'curl'
        end

        def curl_v
          command.run('curl -V') do |out, err|
            raise CurlError, err if err

            logger.success out.scan(curl_semver)
          end
        end

        def command
          TTY::Command.new(printer: :null)
        end

        def curl_semver
          /curl \d*\.\d*\.\d*/
        end

        def logger
          TTY::Logger.new
        end
      end
    end
  end
end
