# typed: strong
# frozen_string_literal: true

module Lumise
  class CLI < Thor
    sig do
      params(
        mappings: T::Hash[T.untyped, T.untyped]
      ).void
    end
    def self.map(mappings)
    end

    sig { void }
    def version
    end

    sig { params(arr: T.untyped).void }
    def rubocop(*arr)
    end

    private

    sig { void }
    def execute_rubocop
    end
  end
end
