# typed: true
# frozen_string_literal: true

require_relative 'lumise/warning'

module Lumise
  def self.config
    require_relative 'lumise/configurations'
    yield Lumise::Configurations
  end
end

begin
  $LOAD_PATH.unshift File.join(File.dirname(__FILE__))
  load '.lumise'
rescue LoadError
  require 'logger'
  Logger.new($stdout).error 'There was an error loading .lumise file'
end
