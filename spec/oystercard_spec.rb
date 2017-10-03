require 'oystercard'

describe OysterCard do

  subject(:oyster) { described_class.new }

  describe '#initialize' do
    it 'creates a balance of zero' do
      expect(oyster.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up a specified amount to the balance' do
      previous_balance = oyster.balance
      expect { oyster.top_up(1) }.to change { oyster.balance }.by 1
    end
    it 'wont add more than the max balance' do
      oyster.top_up(OysterCard::MAX_BALANCE)
      expect { oyster.top_up(1) }.to raise_error "Sorry, can't add more than £#{OysterCard::MAX_BALANCE}!"
    end
  end

  describe '#deduct' do
    it 'deducts a specified amount from the balance' do
      oyster.top_up(20)
      expect { oyster.deduct(5) }.to change { oyster.balance }.by -5
    end
  end

  describe '#in_journey' do
    it "reports on the journey status of the card" do
      expect(oyster).to_not be_in_journey
    end
  end

  describe '#touch_in' do
    it 'activates the in journey status' do
      oyster.top_up(OysterCard::MAX_BALANCE)
      oyster.touch_in
      expect(oyster).to be_in_journey
    end
    it 'returns an error when the card balance is less than 1' do
      expect{ oyster.touch_in }.to raise_error "minimum balance of £#{OysterCard::MINIMUM_BALANCE} required to touch in"
    end
  end

  describe '#touch_out' do
    it 'deactivates the in journey status' do
      oyster.top_up(OysterCard::MAX_BALANCE)
      oyster.touch_in
      oyster.touch_out
      expect(oyster).to_not be_in_journey
    end
  end

end
