require 'journey'

class OysterCard
  attr_reader :balance, :journey_history, :entry_station, :current_journey

  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_history = []
  end

  def top_up(amount)
    raise "Sorry, can't add more than £#{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "minimum balance of £#{MINIMUM_BALANCE} required to touch in" unless @balance >= MINIMUM_BALANCE
    if @current_journey
      deduct @current_journey.fare
    end
    journey = Journey.new
    journey.start station
    @current_journey = journey
  end

  def touch_out(station)
    if !@current_journey
      @current_journey = Journey.new
    end
    @current_journey.finish station
    deduct @current_journey.fare
    @journey_history << @current_journey
    @current_journey = nil
  end

  def in_journey?
    entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
