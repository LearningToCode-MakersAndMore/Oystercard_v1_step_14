class Oystercard

  attr_reader :balance

  def initialize(balance = 0)
    self.balance = balance
  end

  def top_up(amount)
    @balance += amount
  end

  private
  attr_writer :balance

end
