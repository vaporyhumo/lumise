# typed: false
# frozen_string_literal: true

require 'lumise/commands/rubocop'

RSpec.describe Lumise::Commands::Rubocop, type: :cli do
  let(:expected_output) do
    <<~OUT
      Usage:
        lumise rubocop

      Options:
        -h, [--help], [--no-help]  # Display usage information

      Set up rubocop
    OUT
  end

  it 'executes `lumise help rubocop` command successfully' do
    output = `lumise help rubocop`

    expect(output).to eq(expected_output)
  end
end
