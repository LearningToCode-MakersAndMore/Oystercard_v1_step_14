class Oystercard

  attr_reader :balance, :in_use

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise("maximum balance = #{MAX_BALANCE}") if self.balance + amount > 90

    self.balance += amount
  end

  def touch_in
    fail "Insufficent funds: £#{MINIMUM_FARE} required to travel" unless @balance > MINIMUM_FARE
    self.in_use = true
  end

  def touch_out
   self.deduct(MINIMUM_FARE)
   self.in_use = false
  end

  def in_journey?
    self.in_use
  end

  private
  attr_writer :balance, :in_use

  def deduct(amount)
    self.balance -= amount
  end

end
