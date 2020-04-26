# frozen_string_literal: true

RSpec.describe Lumise::CLI do
  describe '#version' do
    it 'prints the version number' do
      expect { described_class.new.version }.to output("v0.2.0\n").to_stdout
    end
  end

  describe '#rubocop' do
    it do
      expect(described_class.new.rubocop).to be
    end

    it do
      cli = described_class.new
      allow(cli).to receive(:options).and_return({ help: true })
      expect(cli.rubocop).to be
    end
  end
end
