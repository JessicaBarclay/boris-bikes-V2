require './lib/docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to (:release_bike) }

    #it 'releases working bikes' do
        #bike = subject.release_bike
        #expect(bike).to be_working
    #end

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike
    end

    describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end


    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }
end
