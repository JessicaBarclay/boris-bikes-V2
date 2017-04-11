require './lib/docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to (:release_bike) }
    
    it { is_expected.to respond_to (:dock).with(1).argument }
end