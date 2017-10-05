class Journey
  attr_reader :entry_station
  attr_accessor :exit_station

  def initialize
    @entry_station = false
    @exit_station = false
  end

  def start(station)
    @entry_station = station
  end

  def complete?
    @entry_station && @exit_station
  end
end
