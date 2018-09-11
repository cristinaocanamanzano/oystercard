
class Oystercard
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station, :journeys, :journey_hash

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
    @journey_hash = {}
  end

  def top_up(money)
    fail "Maximum limit exceeded!!" if @balance + money > CARD_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(start_point)
    @entry_station = start_point
    fail "Sorry, the minimum balance needed is £1" if @balance < MINIMUM_BALANCE
    @in_journey = true
    @journey_hash[:entry_station] = start_point
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
    @entry_station = nil
  end
end
