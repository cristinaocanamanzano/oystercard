require './lib/station'

describe Station do
  describe "#initialize" do
    subject {described_class.new(name: "Woodford", zone: 5)}
    it "has a name" do
      expect(subject.name).to eq "Woodford"
    end

    it "has a zone assigned" do
      expect(subject.zone).to eq 5
    end
  end
end
