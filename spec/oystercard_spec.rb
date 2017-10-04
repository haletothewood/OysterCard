require 'oystercard'

describe OysterCard do
  subject(:oyster) { described_class.new }
  let(:max_balance) { OysterCard::MAX_BALANCE }
  let(:min_balance) { OysterCard::MINIMUM_BALANCE }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  describe '#initialize' do
    it 'creates a balance of zero' do
      expect(oyster.balance).to eq 0
    end
    it 'has an empty list of journeys by default' do
      expect(oyster.journey_history).to be_empty
    end
  end

  describe '#top_up' do
    it 'tops up a specified amount to the balance' do
      expect { oyster.top_up(1) }.to change { oyster.balance }.by 1
    end
    it 'wont add more than the max balance' do
      oyster.top_up(max_balance)
      expect { oyster.top_up(1) }.to raise_error "Sorry, can't add more than £#{max_balance}!"
    end
  end

  describe '#in_journey' do
    it 'reports on the journey status of the card' do
      expect(oyster).to_not be_in_journey
    end
  end

  describe '#touch_in' do
    it 'activates the in journey status' do
      oyster.top_up(max_balance)
      oyster.touch_in(entry_station)
      expect(oyster).to be_in_journey
    end
    it 'will not let you touch in when insufficient funds' do
      expect { oyster.touch_in(entry_station) }.to raise_error "minimum balance of £#{min_balance} required to touch in"
    end
    it 'remembers the entry station' do
      oyster.top_up(max_balance)
      oyster.touch_in(entry_station)
      expect(oyster.entry_station).to eq entry_station
    end
  end

  describe '#touch_out' do
    before(:each) do
      oyster.top_up(max_balance)
      oyster.touch_in(entry_station)
    end
    it 'deactivates the in journey status' do
      oyster.touch_out(exit_station)
      expect(oyster).to_not be_in_journey
    end
    it 'charges the minimum fare for the journey' do
      expect { oyster.touch_out(exit_station) }.to change { oyster.balance }.by(-min_balance)
    end
    it 'forgets the entry station' do
      oyster.touch_out(exit_station)
      expect(oyster.entry_station).to eq nil
    end

    let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

    it 'saves the journey history' do
      oyster.touch_out(exit_station)
      expect(oyster.journey_history).to include journey
    end
  end
end
