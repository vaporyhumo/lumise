# frozen_string_literal: true

RSpec.describe Lumise::Which::Curl do
  it do
    allow(described_class).to receive(:curl_exists?).and_return(false)

    expect do
      described_class.call
    end.to raise_error Lumise::Which::Curl::CurlError, "Couldn't find curl"
  end
end
