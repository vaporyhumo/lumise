# frozen_string_literal: true

class LDummy
  extend Lumise::L
end

RSpec.describe Lumise::L do
  describe '#l' do
    it 'returns Lumise::Configurations' do
      expect(LDummy.l).to be_a Lumise::Configurations
    end
  end
end
