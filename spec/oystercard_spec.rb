require 'oystercard.rb'

describe Oystercard do

  it 'oystercard.balance should return 0' do
    expect(subject.balance).to eq(0)
  end

  it 'oystercard can be topped up using top_up' do
    expect{ subject.top_up(10) }.to change{ subject.balance }.by(10)
  end

  it 'oystercard.top_up should return error if balance > 90' do
    expect {subject.top_up(100)}.to raise_error("maximum balance = #{MAX_BALANCE}")
  end

end
