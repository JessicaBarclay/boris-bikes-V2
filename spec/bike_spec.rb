require './lib/bike.rb'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  # it 'stores the state of a bike as broken if a customer returns a broken bike' do
  #     bike = Bike.new
  #     expect(bike.working?(false)).to eq false
  #   end
  
  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
