require 'journey.rb'
require 'oystercard.rb'
require 'station.rb'

describe Journey do

  it 'Journey.new shoudl eq []' do
    expect(subject.Trips).to eq([])
  end

end
