describe String do
  context "#co_all_spaces?" do
    it "returns correct values when no options present" do
      expect("This is a test".co_all_spaces?).to eq(false)
      expect("     ".co_all_spaces?).to eq(true)
      expect("    \n ".co_all_spaces?).to eq(false)
      expect("".co_all_spaces?).to eql(false)
    end
    it "returns correct values when when_empty: false" do
      expect("This is a test".co_all_spaces?(when_empty: false)).to eq(false)
      expect("     ".co_all_spaces?(when_empty: false)).to eq(true)
      expect("    \n ".co_all_spaces?(when_empty: false)).to eq(false)
      expect("".co_all_spaces?(when_empty: false)).to eql(false)
    end
    it "returns correct values when when_empty: set" do
      expect("This is a test".co_all_spaces?(when_empty: true)).to eq(false)
      expect("     ".co_all_spaces?(when_empty: true)).to eq(true)
      expect("    \n ".co_all_spaces?(when_empty: true)).to eq(false)
      expect("".co_all_spaces?(when_empty: true)).to eql(true)
    end
  end
end
