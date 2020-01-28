require 'oystercard.rb'

describe Oystercard do

  it 'oystercard.balance should return 0' do
    expect(subject.balance).to eq(0)
  end

  it 'oystercard can be topped up using top_up' do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
  end

  it "oystercard.top_up should return error if balance > #{Oystercard::MINIMUM_FARE}" do
    expect {subject.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error("maximum balance = #{Oystercard::MAX_BALANCE}")
  end

  it 'oystercard.in_journey should return true or false' do
    expect(subject.in_journey?).to be_truthy.or be_falsey
  end
  it "oystercard.touch_in should raise error if balance < #{Oystercard::MINIMUM_FARE}" do
    expect{ subject.touch_in }.to raise_error "Insufficent funds: £#{Oystercard::MINIMUM_FARE} required to travel"
  end

  it "oystercard.touch_out should reduce balance by #{Oystercard::MINIMUM_FARE}" do
    expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end
  it "oystercard should remember the last station it was touched in at" do
    subject.top_up(10)
    expect { subject.touch_in("station") }.to change { subject.entry_station }.to("station")
  end

  it 'oystercard.trips should eq []' do
    expect(subject.trips).to eq([])
  end

  it 'trips should return entry and exit stations' do
    subject.top_up(50)
    subject.touch_in('France')
    subject.touch_out('Australia')
    expect(subject.trips).to eq('Start: France, End: Australia')
  end

end
