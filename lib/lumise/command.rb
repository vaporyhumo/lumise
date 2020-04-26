# typed: true
# frozen_string_literal: true

require 'forwardable'
require_relative 'commands'

module Lumise
  class Command
    extend Forwardable
    include Commands

    def_delegators :command, :run

    def execute(*)
      raise(
        NotImplementedError,
        "#{self.class}##{__method__} must be implemented"
      )
    end
  end
end
