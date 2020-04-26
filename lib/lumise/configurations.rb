# typed: true
# frozen_string_literal: true

module Lumise
  Configurations = OpenStruct.new(
    force: false,
    plugins: %w[performance rspec]
  )
end

# force = true
# plugins = %w[performance rails rspec sorbet]
# repo    = "git@github.com:vaporyhumo/lumise-templates.git"
# branch  = 'recorrido-master'
#
# update_gems = false
# update_files = true
# update_todo = true
