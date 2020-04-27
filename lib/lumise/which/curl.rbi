# typed: strong
# frozen_string_literal: true

module Lumise
  module Which
    module Curl
      class << self
        sig { void }
        def call
        end

        private

        sig { returns T::Boolean }
        def curl_exists?
        end

        sig { void }
        def curl_v
        end

        sig { returns TTY::Command }
        def command
        end

        sig { returns Regexp }
        def curl_semver
        end

        sig { returns TTY::Logger }
        def logger
        end
      end
    end
  end
end
