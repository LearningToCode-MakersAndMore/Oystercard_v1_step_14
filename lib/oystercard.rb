class Oystercard

  attr_reader :balance

  def initialize(balance = 0)
    self.balance = balance
  end

  def top_up(amount)
    raise("maximum balance = #{MAX_BALANCE}") if self.balance + amount > 90

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  MAX_BALANCE = 90

  private
  attr_writer :balance

end
