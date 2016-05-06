describe String do
  context "#co_force_leading_space" do
    it "works correctly with defaults" do
      expect("".co_force_leading_space).to eq("")
      expect("Test".co_force_leading_space).to eq(" Test")
      expect(" Test".co_force_leading_space).to eq(" Test")
      expect("       Test".co_force_leading_space).to eq(" Test")
      expect("       Test  ".co_force_leading_space).to eq(" Test  ")
      expect("   ".co_force_leading_space).to eq("   ")
    end
    it "works correctly when even_when_empty: true" do
      expect("".co_force_leading_space(even_when_empty: true)).to eq(" ")
      expect("Test".co_force_leading_space(even_when_empty: true)).to eq(" Test")
      expect(" Test".co_force_leading_space(even_when_empty: true)).to eq(" Test")
      expect("       Test".co_force_leading_space(even_when_empty: true)).to eq(" Test")
      expect("       Test  ".co_force_leading_space(even_when_empty: true)).to eq(" Test  ")
      expect("   ".co_force_leading_space(even_when_empty: true)).to eq("   ")
    end
  end
end
