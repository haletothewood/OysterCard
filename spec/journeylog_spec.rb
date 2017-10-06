require 'journeylog'

describe JourneyLog do
  let(:station) {double :station}
  let(:journey) {double :journey, entry_station: station, exit_station: false}

  context 'when initialized' do
    it 'has an incomplete journey stored' do
      journeylog = JourneyLog.new(journey)
      expect(journeylog.journey_class.entry_station).to eq station
    end
    it 'starts a journey' do
      allow(journey).to receive(:start).and_return(station)
      journeylog = JourneyLog.new(journey)
      expect(journeylog.journey_class).to eq journey
    end
  end
end
