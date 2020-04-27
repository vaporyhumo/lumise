# typed: strict
# frozen_string_literal: true

module Lumise
  sig { returns Lumise::Configurations }
  def self.config(&blk)
  end

  sig { void }
  def self.load_dotfile
  end
end
