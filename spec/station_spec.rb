require "station.rb"
describe Station do
    subject {Station.new("Test", 1)}
    it "Should be able to display what zone a station is in" do
        expect(subject.zone).to eq (1)
    end
    it "Should be able to display what name a station has" do
        expect(subject.name).to eq ("Test")
    end

end


