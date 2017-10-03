class OysterCard
  attr_reader :balance
  MAX_BALANCE = 90
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    fail "Sorry, can't add more than £#{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in
    raise "minimum balance of £#{MINIMUM_BALANCE} required to touch in" unless @balance >= MINIMUM_BALANCE
    @active = true
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @active = false
  end

  def in_journey?
    @active
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
