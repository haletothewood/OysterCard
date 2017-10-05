require 'journey'

describe Journey do
  let(:entry_station) { double (:station) }
  let(:exit_station) { double (:station) }
  let(:journey) { Journey.new }

  context 'after touch in' do
    it 'has an entry station' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
    it 'shows as incomplete' do
      expect(journey).not_to be_complete
    end
  end

  context 'after touch out' do
    before(:each) do
      journey.start(entry_station)
      journey.exit_station = exit_station
    end
    it 'has an exit_station' do
      expect(journey.exit_station).to eq exit_station
    end
    it 'shows as complete' do
      expect(journey).to be_complete
    end
  end

end
