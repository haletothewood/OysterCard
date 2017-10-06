require 'journey'

class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
  end

  def start
    journey_class.start
  end

  def finish
    journey_class.finish
  end

end
