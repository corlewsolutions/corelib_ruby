RSpec.describe String do
  context "#cl_first" do
    it "returns the first character of a non empty string" do
      expect("test".cl_first).to eq("t")
    end
    it "returns an empty string when string is empty" do
      expect("".cl_first).to eq("")
    end
  end

  context "#cl_first_or_nil" do
    it "returns the first character of a non empty string" do
      expect("test".cl_first_or_nil).to eq("t")
    end
    it "returns empty string when string is empty" do
      expect("".cl_first_or_nil).to eq(nil)
    end
  end

  context "#cl_last" do
    it "returns the last character of a non empty string" do
      expect("testy".cl_last).to eq("y")
    end
    it "returns an empty string when string is empty" do
      expect("".cl_last).to eq("")
    end
  end

  context "#cl_last_or_nil" do
    it "returns the last character of a non empty string" do
      expect("test".cl_last_or_nil).to eq("t")
    end
    it "returns empty string when string is empty" do
      expect("".cl_last_or_nil).to eq(nil)
    end
  end

  context "#cl_not_empty?" do
    it "works" do
      expect("".cl_not_empty?).to be false
      expect("test".cl_not_empty?).to be true
    end
  end
end
