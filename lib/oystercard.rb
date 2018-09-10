class Oystercard
  CARD_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum limit exceeded!!" if @balance + money > CARD_LIMIT
    @balance = @balance + money
  end


end
