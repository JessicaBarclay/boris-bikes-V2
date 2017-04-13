class Bike
  attr_reader :state

  # def initialize(state=true)
  #   @state = state
  # end
  

  def working?#(state=true)
    true
  end
  
  def report_broken
    @broken = true
  end
  
  def broken?
    @broken
  end
  
end
