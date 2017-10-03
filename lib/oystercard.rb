class OysterCard
  attr_reader :balance
  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    fail "Sorry, can't add more than £#{MAX_BALANCE}!" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
