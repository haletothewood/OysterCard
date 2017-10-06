class Journey
  attr_reader :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station:, exit_station:)
    @entry_station = entry_station
    @exit_station = exit_station
    minimum_fare = MINIMUM_FARE
    penalty_fare = PENALTY_FARE
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  private

  def complete?
    !!@entry_station && @exit_station
  end
end
