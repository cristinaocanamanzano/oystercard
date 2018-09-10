require './lib/oystercard'

describe Oystercard do

  it 'shows us the balance of a new card' do
    expect(subject.balance).to eq 0
  end
  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it "adds money to card" do
      expect{ subject.top_up 1 }.to change{ subject.balance}.by 1
    end

    it 'raises an error when limit exceeded' do
      expect{ subject.top_up(91) }.to raise_error "Maximum limit exceeded!!"
    end
  end
  describe "#deduct" do
    it "takes away a specific amount of money from the balance" do
      expect{ subject.deduct 3 }.to change{ subject.balance}.by -3
    end
  end
  describe '#in_journey?' do
    it 'returns false if card is not in use' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'changes in_use status to true' do
      expect(subject.touch_in).to eq true
    end
  end

  describe '#touch_out' do
    it 'changes in_use status to false' do
      expect(subject.touch_out).to eq false
    end
  end
end
