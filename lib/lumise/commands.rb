# typed: false
# frozen_string_literal: true

require 'forwardable'

module Lumise
  module Commands
    def command(**options)
      require 'tty-command'
      TTY::Command.new(options)
    end

    def generator
      require 'tty-file'
      TTY::File
    end

    def logger
      require 'tty-logger'
      TTY::Logger.new
    end

    def prompt(**options)
      require 'tty-prompt'
      TTY::Prompt.new(options)
    end

    def which(*args)
      require 'tty-which'
      TTY::Which.which(*args)
    end

    def exec_exist?(*args)
      require 'tty-which'
      TTY::Which.exist?(*args)
    end
  end
end
