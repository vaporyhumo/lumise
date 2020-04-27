# typed: strict
# frozen_string_literal: true

require 'tty-command'
require 'tty-file'
require 'tty-logger'
require 'tty-prompt'
require 'tty-which'

module Lumise
  module Commands
    def command(options)
      TTY::Command.new(options)
    end

    def generator
      TTY::File
    end

    def logger
      TTY::Logger.new
    end

    def prompt(**options)
      TTY::Prompt.new(options)
    end

    def which(cmd)
      TTY::Which.which(cmd)
    end

    def exec_exist?(cmd)
      TTY::Which.exist?(cmd)
    end
  end
end
