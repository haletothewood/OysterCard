class OysterCard

  attr_reader :balance, :journey_history
  attr_accessor :entry_station

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_history = []
  end

  def top_up(amount)
    fail "Sorry, can't add more than £#{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "minimum balance of £#{MINIMUM_BALANCE} required to touch in" unless @balance >= MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @journey_history << { entry_station: @entry_station, exit_station: station }
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
