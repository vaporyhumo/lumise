# typed: true
# frozen_string_literal: true

module Lumise
  class Configurations
    def self.force
      @force ||= false
    end

    def self.branch
      @branch ||= 'master'
    end

    def self.repo
      @repo ||= 'lumise-rubocop'
    end

    def self.user
      @user ||= 'vaporyhumo'
    end

    class << self
      attr_writer :force
    end

    class << self
      attr_writer :branch
    end

    class << self
      attr_writer :repo
    end

    class << self
      attr_writer :user
    end
  end
end
