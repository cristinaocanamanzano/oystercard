class Oystercard
  CARD_LIMIT = 90
  attr_reader :balance
  attr_reader :in_journey

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum limit exceeded!!" if @balance + money > CARD_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?(in_journey = false)
    @in_journey = in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
