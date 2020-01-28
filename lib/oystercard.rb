class Oystercard

  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @trips = []
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
   self.deduct(MINIMUM_FARE)
   trip = {Start: @entry_station, End: exit_station}
   self.trips << trip
   self.entry_station = nil
  end

  def in_journey?
    self.entry_station == nil ? false : true
  end

  def trips
    @trips.each { |journey| return "Start: #{journey[:Start]}, End: #{journey[:End]}" }
  end

  private
  attr_writer :balance, :entry_station, :trips

  def deduct(amount)
    self.balance -= amount
  end

end
