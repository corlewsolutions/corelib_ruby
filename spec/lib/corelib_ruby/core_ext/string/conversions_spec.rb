describe String do
  context "#force_leading_space" do
    it "works correctly with defaults" do
      expect("".force_leading_space).to eq("")
      expect("Test".force_leading_space).to eq(" Test")
      expect(" Test".force_leading_space).to eq(" Test")
      expect("       Test".force_leading_space).to eq(" Test")
      expect("       Test  ".force_leading_space).to eq(" Test  ")
      expect("   ".force_leading_space).to eq("   ")
    end
    it "works correctly when even_when_empty: true" do
      expect("".force_leading_space(even_when_empty: true)).to eq(" ")
      expect("Test".force_leading_space(even_when_empty: true)).to eq(" Test")
      expect(" Test".force_leading_space(even_when_empty: true)).to eq(" Test")
      expect("       Test".force_leading_space(even_when_empty: true)).to eq(" Test")
      expect("       Test  ".force_leading_space(even_when_empty: true)).to eq(" Test  ")
      expect("   ".force_leading_space(even_when_empty: true)).to eq("   ")
    end
  end
end
