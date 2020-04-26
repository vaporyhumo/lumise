# frozen_string_literal: true

require 'crystalball'
require 'crystalball/map_generator/parser_strategy'

if ENV['CRYSTALBALL'] == 'true'
  Crystalball::MapGenerator.start! do |config|
    config.register Crystalball::MapGenerator::CoverageStrategy.new
    config.register Crystalball::MapGenerator::DescribedClassStrategy.new
    config.register Crystalball::MapGenerator::ParserStrategy.new(
      pattern: /\A(lib)/
    )
  end
end
