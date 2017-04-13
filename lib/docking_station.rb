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
    unless @bikes[-1].broken?
    @bikes.pop
    end
  end

  def dock(bike, state=true)
    fail 'Docking station full' if full?
    state == true ? bike.working? : bike.report_broken
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
