# frozen_string_literal: true

module DotSimplecov
  def self.perform
    config_lcov
    config_formatters
    start_simplecov
    require_undercover
    log
  end

  private

  def self.config_lcov
    require 'simplecov-lcov'
    SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
  end

  def self.config_formatters
    SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::LcovFormatter
    ])
  end

  def self.start_simplecov
    SimpleCov.start do
      add_group /lib/
      add_group /exe/
      add_group /spec/
    end
  end

  def self.require_undercover
    require 'undercover'
  end

  def self.log
    require 'logger'
    Logger.new(STDOUT).info 'required simplecov'
  end
end

DotSimplecov.perform
