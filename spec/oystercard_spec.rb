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
  end
end
