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

  describe '#touch_in' do
    it 'responds to touch_in method' do
      expect(oyster).to respond_to(:touch_in)
    end
  end

  describe '#in_journey' do
    it 'responds to in_journey method' do
      expect(oyster).to respond_to(:in_journey?)
    end
    it 'should return true after touch_in' do
      oyster.touch_in
      expect(oyster).to be_in_journey
    end
  end

  # describe '#touch_out' do
  #   it 'responds to touch_out method' do
  #     expect(oyster).to respond_to(:touch_out)
  #   end
  # end

end
