require 'oystercard'

describe OysterCard do
  describe '#initialize' do
    it 'creates a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'tops up balance' do
      expect(subject).to respond_to(:top_up).with(1).argument 
    end



  end



end
