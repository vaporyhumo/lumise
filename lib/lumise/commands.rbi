# typed: strong
# frozen_string_literal: true

module Lumise
  module Commands
    sig { params(options: T.untyped).returns(TTY::Command) }
    def command(options)
    end

    sig { returns(T.class_of(TTY::File)) }
    def generator
    end

    sig { returns(TTY::Logger) }
    def logger
    end

    sig { params(options: T::Hash[T.untyped, T.untyped]).returns TTY::Prompt }
    def prompt(**options)
    end

    sig { params(cmd: String).returns T::Array[String] }
    def which(cmd)
    end

    sig { params(cmd: String).returns T::Boolean }
    def exec_exist?(cmd)
    end
  end
end
