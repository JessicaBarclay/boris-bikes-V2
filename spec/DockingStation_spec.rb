require 'DockingStation'

describe 'DockingStation' do
    it 'DockingStation responds_to release_bike' do
        expect(docking_station.release_bike()).to eq nil
    end
    
end