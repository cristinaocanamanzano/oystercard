require './lib/oystercard'

describe Oystercard do

  it 'shows us the balance of a new card' do
    expect(subject.balance).to eq 0
  end
  describe "#top_up" do
    it "adds money to card" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'raises an error when limit exceeded' do
      expect{ subject.top_up(91) }.to raise_error "Maximum limit exceeded!!"
    end

    it 'raises an error when top up twice and limit exceeded' do
      subject.top_up(50)
      expect{ subject.top_up(41) }.to raise_error "Maximum limit exceeded!!"
    end
  end
  describe "#deduct" do
    it "takes away a specific amount of money from the balance" do
      expect{ subject.deduct 3 }.to change{ subject.balance }.by -3
    end
  end
  describe '#in_journey?' do
    it 'returns false if card is not in use' do
      expect(subject.in_journey?).to eq false
    end
  end


  describe '#touch_in' do
    context 'when balance too low' do
      it 'raises an error if balance is less than 1 when touching in' do
        expect{ subject.touch_in('start_point') }.to raise_error "Sorry, the minimum balance needed is £1"
      end
    end
    context 'when balance above MINIMUM_BALANCE' do
      before do
        subject.top_up(1)
        subject.touch_in('aldgate')
      end

      it 'changes in_journey status to true' do
        expect(subject.in_journey?).to eq true
      end

      it 'saves the station of entry' do
        expect(subject.station).to eq 'aldgate'
      end
    end
  end

  describe '#touch_out' do
    it 'deducts money from balance when touched out' do
      subject.top_up(1)
      expect{ subject.touch_out }.to change{ subject.balance }.by -1
    end
    it 'changes in_use status to false' do
      expect(subject.touch_out).to eq false
    end
  end
end
