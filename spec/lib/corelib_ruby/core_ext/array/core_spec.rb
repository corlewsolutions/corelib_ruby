RSpec.describe Array do
  describe "#co_not_empty?" do
    it "works" do
      expect([].co_not_empty?).to be false
      expect([1].co_not_empty?).to be true
    end
  end

  describe "#co_to_yes_no" do
    it "converts correctly" do
      expect([false, true].co_to_yes_no).to eq(["No", "Yes"])
      expect([1, 0].co_to_yes_no).to eq(["Yes", "No"])
      expect(["false", "t"].co_to_yes_no).to eq(["No", "Yes"])
    end
    it "converts correctly with options" do
      #This only tests that the options array is correctly passed along
      #All the various options are tested in other tests
      expect([false, true].co_to_yes_no(if_no: "NO", if_yes: "YES")).to eq(["NO", "YES"])
    end
  end
end
