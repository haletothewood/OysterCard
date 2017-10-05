require 'station'

describe Station do

  let(:station) { described_class.new(name: 'Aldgate East', zone: 1) }
  it 'should have a name' do
    expect(station.name).to eq 'Aldgate East'
  end
  it 'should have a zone' do
    expect(station.zone).to eq 1
  end
end
