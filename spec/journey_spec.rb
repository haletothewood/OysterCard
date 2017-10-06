require 'journey'

describe Journey do
  let(:entry_station) { double (:station) }
  let(:exit_station) { double (:station) }
  let(:journey) { Journey.new(entry_station: false, exit_station: false) }

  context 'after touch in' do
    before(:each) { journey.start(entry_station) }
    it 'has an entry station' do
      expect(journey.entry_station).to eq entry_station
    end
  end

  context 'after touch out' do
    it 'has an exit_station' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

  context 'after a completed journey' do
    it 'returns the minimum fare' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end

  context 'after an incomplete journey' do
    it 'returns a penalty fare if fail to touch out' do
      journey.start(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'returns a penalty fare if fail to touch in' do
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

end
