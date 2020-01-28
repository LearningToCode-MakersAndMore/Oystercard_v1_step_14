require 'oystercard.rb'

describe Oystercard do

  it 'oystercard.balance should return 0' do
    expect(subject.balance).to eq(0)
  end

  it 'oystercard can be topped up using top_up' do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
  end

  it 'oystercard.top_up should return error if balance > 90' do
    expect {subject.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error("maximum balance = #{Oystercard::MAX_BALANCE}")
  end

  it 'oystercard.deduct should deduct fare from balance' do
    expect{ subject.deduct(5) }.to change{ subject.balance }.by(-5)
  end

  it 'oystercard.touch_in should result in in_use == true' do
    subject.top_up(10)
    expect(subject.touch_in).to eq(true)
  end

  it 'oystercard.touch_out should result in in_use == false' do
    expect(subject.touch_out).to eq(false)
  end

  it 'oystercard.in_journey should return true or false' do
    expect(subject.in_journey?).to be_truthy.or be_falsey
  end
  it "oystercard.touch_in should raise error if balance < #{Oystercard::MINIMUM_FARE}" do
    expect{ subject.touch_in }.to raise_error "Insufficent funds: £#{Oystercard::MINIMUM_FARE} required to travel"
  end
end
