class Oystercard

  attr_reader :balance, :in_use

  MAX_BALANCE = 90

  def initialize(balance = 0)
    self.balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise("maximum balance = #{MAX_BALANCE}") if self.balance + amount > 90

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    self.in_use = true
  end

  def touch_out
   self.in_use = false
  end

  def in_journey?
    @in_use
  end

  private
  attr_writer :balance, :in_use

end
