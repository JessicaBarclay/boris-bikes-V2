require './lib/docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it { is_expected.to respond_to(:bikes) }
  it 'has an attribute set to an instance of Bike post docking' do
    bike = double(:bike)
    allow(bike).to receive(:working?)
    expect(subject.dock bike ).to eq subject.bikes
  end
  it 'has a @capacity variable' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  it 'can specify a value for @capacity instead of the DEFAULT_CAPACITY when initializing a station' do
    subject = DockingStation.new(50)
    expect(subject.capacity).to eq 50
  end
  it 'docks bike' do
    bike = double(:bike)
    allow(bike).to receive(:working?)
    subject.dock(bike)
    expect(subject.bikes).to include bike
  end
  describe '#release_bike' do
    it 'releases working bikes' do
    bike = double(:bike, broken?: false, working?: true)
    subject.dock bike
    expect(subject.release_bike).to be bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    it 'won\'t release broken bike' do
      bike = double(:bike, working?: false, broken?: true, report_broken: true)
      subject.dock(bike, false)
      expect(subject.release_bike).to eq nil
    end
    describe '#dock' do
      let(:bike) {double :bike}
      it 'raises an error when full' do
        allow(bike).to receive(:working?)
        DockingStation::DEFAULT_CAPACITY.times { subject.dock bike }
        expect { subject.dock bike }.to raise_error 'Docking station full'
      end
      it 'knows when it\'s full even if a custom capacity has been set' do
        allow(bike).to receive(:working?)
        subject.capacity.times { subject.dock bike }
        expect { subject.dock bike }.to raise_error 'Docking station full'
      end
      it 'can report a bike as broken' do
        expect(subject).to respond_to(:dock).with(2).arguments
      end
    end
  end
end
