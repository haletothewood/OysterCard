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
      #expect(subject.top_up(10)).to eq previous_balance + 10
      expect { subject.top_up(1) }.to change { subject.balance }.by 1
    end
    it 'wont add more than the max balance' do
      subject.top_up(OysterCard::MAX_BALANCE)
      expect { subject.top_up(1) }.to raise_error "Sorry, can't add more than £#{OysterCard::MAX_BALANCE}!"
    end
  end

end
