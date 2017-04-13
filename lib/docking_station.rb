require './lib/bike'

class DockingStation
  attr_reader :bikes, :capacity
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike, state=nil)
    fail 'Docking station full' if full?
    @bikes << bike
  end
  
  private
  
  def full?
    @bikes.count >= @capacity
  end
  
  def empty?
    @bikes.empty?
  end
end

#docking_station = DockingStation.new
