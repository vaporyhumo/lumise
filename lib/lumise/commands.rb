# typed: false
# frozen_string_literal: true

require 'forwardable'

module Lumise
  module Commands
    def command(**options)
      require 'tty-command'
      TTY::Command.new(options)
    end

    def cursor
      require 'tty-cursor'
      TTY::Cursor
    end

    # def editor
    #   require 'tty-editor'
    #   TTY::Editor
    # end

    def generator
      require 'tty-file'
      TTY::File
    end

    def logger
      require 'tty-logger'
      TTY::Logger.new
    end

    # def pager(**options)
    #   require 'tty-pager'
    #   TTY::Pager.new(options)
    # end

    # def platform
    #   require 'tty-platform'
    #   TTY::Platform.new
    # end

    def prompt(**options)
      require 'tty-prompt'
      TTY::Prompt.new(options)
    end

    def screen
      require 'tty-screen'
      TTY::Screen
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
