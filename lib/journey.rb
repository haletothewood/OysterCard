class Journey
  attr_reader :entry_station, :exit_station

  def initialize(entry_station:, exit_station:)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    complete? ? 1 : 6
  end

  private

  def complete?
    @entry_station && @exit_station
  end
end
