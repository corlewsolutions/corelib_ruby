RSpec.describe Array do
  describe "#cl_not_empty?" do
    it "works" do
      expect([].cl_not_empty?).to be false
      expect([1].cl_not_empty?).to be true
    end
    it "is aliased" do
      expect([]._not_empty?).to be false
    end
  end

  describe "#cl_to_yes_no" do
    it "converts correctly" do
      expect([false, true].cl_to_yes_no).to eq(["No", "Yes"])
      expect([1, 0].cl_to_yes_no).to eq(["Yes", "No"])
      expect(["false", "t"].cl_to_yes_no).to eq(["No", "Yes"])
    end
    it "converts correctly with options" do
      expect([false, true].cl_to_yes_no(if_no: "NO", if_yes: "YES")).to eq(["NO", "YES"])
    end
    it "is aliased" do
      expect([1, 0]._to_yes_no).to eq(["Yes", "No"])
    end
  end
end
