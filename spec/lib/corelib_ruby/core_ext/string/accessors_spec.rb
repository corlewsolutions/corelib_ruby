describe String do
  context "#co_first" do
    it "returns the first character of a non empty string" do
      expect("test".co_first).to eq("t")
    end
    it "returns an empty string when string is empty" do
      expect("".co_first).to eq("")
    end
  end

  context "#co_first_or_nil" do
    it "returns the first character of a non empty string" do
      expect("test".co_first_or_nil).to eq("t")
    end
    it "returns empty string when string is empty" do
      expect("".co_first_or_nil).to eq(nil)
    end
  end

  context "#co_last" do
    it "returns the last character of a non empty string" do
      expect("testy".co_last).to eq("y")
    end
    it "returns an empty string when string is empty" do
      expect("".co_last).to eq("")
    end
  end

  context "#co_last_or_nil" do
    it "returns the last character of a non empty string" do
      expect("test".co_last_or_nil).to eq("t")
    end
    it "returns empty string when string is empty" do
      expect("".co_last_or_nil).to eq(nil)
    end
  end

  context "#co_first_words" do
    it "returns correct values when a limiter is given" do
      expect("This is a test".co_first_words(0)).to eq("")
      expect("This is a test".co_first_words(2)).to eq("This is")
      expect("This is a test".co_first_words(4)).to eq("This is a test")
    end
    it "returns correct values when limiter is given and ellipses: set" do
      expect("".co_first_words(0, ellipses: true)).to eq("")
      expect("".co_first_words(0, ellipses: " +++")).to eq("")
      expect("This is a test".co_first_words(2, ellipses: true)).to eq("This is ...")
      expect("This is a test".co_first_words(2, ellipses: " +++")).to eq("This is +++")
      expect("This is a test".co_first_words(4, ellipses: true)).to eq("This is a test")
      expect("This is a test".co_first_words(4, ellipses: " +++")).to eq("This is a test")
    end
    it "returns correct values when no limiter is given" do
      expect("".co_first_words).to eq("")
      expect("This is a test".co_first_words).to eq("This is a test")
    end
    it "returns correct values when no limiter is given and ellipses: set" do
      expect("".co_first_words(nil, ellipses: true)).to eq("")
      expect("This is a test".co_first_words(nil, ellipses: true)).to eq("This is a test")
    end
  end
end
