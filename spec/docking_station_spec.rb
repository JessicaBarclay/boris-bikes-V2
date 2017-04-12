require './lib/docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to (:release_bike) }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bikes) }

    it 'has an attribute set to an instance of Bike post docking' do
        expect(subject.dock(Bike.new)).to eq subject.bikes
    end

    describe '#release_bike' do
        it 'releases a bike' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to be_an_instance_of Bike
        end
    end

    it 'expects the bike to be working' do
        subject.dock(Bike.new)
        expect(subject.release_bike).to be_working
    end

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bikes).to include bike
    end

    describe '#release_bike' do
        it 'raises an error when there are no bikes available' do
            expect { subject.release_bike }.to raise_error 'No bikes available'
        end
    end

    describe '#dock' do
        it 'raises an error when full' do
            DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
            expect { subject.dock Bike.new }.to raise_error 'Docking station full'
        end
    end
    
    it 'has a @capacity variable' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    
    it 'can specify a value for @capacity instead of the DEFAULT_CAPACITY when initialising a station' do
        station = DockingStation.new(30)
        expect(station.capacity).to eq 30
    end
        
            
end
