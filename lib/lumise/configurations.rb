# typed: true
# frozen_string_literal: true

module Lumise
  class Configurations
    @configs = { force: false }

    def self.[]=(key, value)
      @configs[key] = value
    end

    def self.[](key)
      @configs[key]
    end
  end
end
