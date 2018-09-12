require './lib/journey'

describe Journey do

  let(:station) { double(:station) }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe 'initialization test' do
    it '@journey_hash is an empty hash' do
      expect(subject.journey_hash).to eq({})
    end
  end  
end
