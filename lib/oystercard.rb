require 'journey.rb'

class Oystercard

  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @trip_log = Journey.new
  end

  def top_up(amount)
    raise("maximum balance = #{MAX_BALANCE}") if self.balance + amount > 90

    self.balance += amount
  end

  def touch_in(station = 0)
    fail "Insufficent funds: £#{MINIMUM_FARE} required to travel" unless @balance > MINIMUM_FARE
    self.entry_station = station
  end

  def touch_out(exit_station = 0)
    self.exit_station = exit_station
    self.deduct(MINIMUM_FARE)
    @trip_log.trip(@entry_station, @exit_station)
  end

  def in_journey?
    self.entry_station == nil ? false : true
  end

  def trips
    @trip_log.trip_list
  end

  private
  attr_writer :balance, :entry_station, :exit_station, :trips

  def deduct(amount)
    self.balance -= amount
  end

end
