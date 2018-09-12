class Oystercard
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :journeys, :journey_hash

  def initialize
    @balance = 0
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
    !(@journey_hash.empty?)
  end

  def touch_in(start_point)
    fail "Sorry, the minimum balance needed is £1" if @balance < MINIMUM_BALANCE
    @in_journey = true
    add_station(:entry_station, start_point)
  end

  def touch_out(exit_point)
    deduct(MINIMUM_BALANCE)
    add_station(:exit_station, exit_point)
    record_journey
    clear_journey_hash
  end

  def add_station(point, station)
    @journey_hash[point] = station
  end

  def record_journey
    @journeys << @journey_hash
  end

  def clear_journey_hash
    @journey_hash = {}
  end
end
