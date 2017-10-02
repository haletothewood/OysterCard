require 'oystercard'

describe OysterCard do
  describe '#initialize' do
    it 'creates a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up balance' do
      previous_balance = subject.balance
      expect(subject.top_up(10)).to eq previous_balance + 10 
    end
  end

end
