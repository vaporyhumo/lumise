# typed: strict
# frozen_string_literal: true

require 'mustache'
require 'sorbet-runtime'
require 'thor'
require 'tty-command'
require 'tty-file'
require 'tty-logger'
require 'tty-prompt'
require 'tty-which'

require_relative 'warning'
require_relative 'lumise/error'
require_relative 'lumise/version'

require_relative 'lumise/cli'
require_relative 'lumise/commands'
require_relative 'lumise/command'
require_relative 'lumise/l'
require_relative 'lumise/logger'
require_relative 'lumise/configurations'

require_relative 'lumise/commands/rubocop'
require_relative 'lumise/services/commands/rubocop/repo_files'
require_relative 'lumise/services/commands/rubocop/update_gems'
require_relative 'lumise/services/commands/rubocop/update_files'
require_relative 'lumise/services/commands/rubocop/update_todo'
require_relative 'lumise/which/curl'

module Lumise
  def self.config(&_blk)
    yield Lumise::Configurations.instance
  end

  def self.load_dotfile
    $LOAD_PATH.unshift File.join(File.dirname(__FILE__))
    load '.lumise'
    Logger.new.success 'loaded .lumise file'
  rescue LoadError
    Logger.new.error 'There was an error loading .lumise file'
  end

  load_dotfile
end
