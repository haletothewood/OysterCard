require 'oystercard'

describe "Using an oystercard" do
  let(:entry_station) { double (:station) }
  let(:exit_station) { double (:station) }
  card = OysterCard.new
  it "works" do
    card.top_up 20
    card.touch_in entry_station
    card.touch_in exit_station
    p card.balance
  end
end
