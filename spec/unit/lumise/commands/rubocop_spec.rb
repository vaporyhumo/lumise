# typed: false
# frozen_string_literal: true

require 'lumise/commands/rubocop'

RSpec.describe Lumise::Commands::Rubocop do
  it 'executes `rubocop` command successfully' do
    output = StringIO.new
    options = {}
    command = described_class.new(options)

    command.execute(_output: output)

    expect(output.string).to eq('')
  end
end
