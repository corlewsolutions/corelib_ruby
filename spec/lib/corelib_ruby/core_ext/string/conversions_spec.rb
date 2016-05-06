RSpec.describe String do
  context "#co_to_yes_no" do
    it 'converts correctly with no options' do
      expect("false".co_to_yes_no).to eq"No"
      expect("FALSE".co_to_yes_no).to eq("No")
      expect("  FALSE  ".co_to_yes_no).to eq("No")
      expect("f".co_to_yes_no).to eq("No")
      expect("F".co_to_yes_no).to eq("No")
      expect("".co_to_yes_no).to eq("No")
      expect("   ".co_to_yes_no).to eq("No")
      expect("0".co_to_yes_no).to eq("No")
      expect("true".co_to_yes_no).to eq("Yes")
      expect("TRUE".co_to_yes_no).to eq("Yes")
      expect("t".co_to_yes_no).to eq("Yes")
      expect("T".co_to_yes_no).to eq("Yes")
      expect("1".co_to_yes_no).to eq("Yes")
      expect("  1  ".co_to_yes_no).to eq("Yes")
    end
  end

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

  describe "#to_bool" do
    it 'converts to true correctly' do
      expect("true".co_to_bool).to be true
      expect("TRUE".co_to_bool).to be true
      expect("t".co_to_bool).to be true
      expect("T".co_to_bool).to be true
      expect("1".co_to_bool).to be true
      expect("yes".co_to_bool).to be true
      expect("YES".co_to_bool).to be true
    end
    it 'converts to false correctly in unstrict mode' do
      expect("false".co_to_bool).to be false
      expect("r".co_to_bool).to be false
      expect("0".co_to_bool).to be false
      expect("Chuck Norris".co_to_bool).to be false
      expect("".co_to_bool).to be false
    end
    it 'converts correctly when using no_strip' do
      expect("false".co_to_bool(strip: false)).to be false
      expect("true".co_to_bool(strip: false)).to be true
      expect("true  ".co_to_bool(strip: false)).to be false
      expect("  1  ".co_to_bool(strip: false)).to be false
    end
    it 'converts to false correctly in strict mode' do
      expect("false".co_to_bool(strict: true)).to be false
      expect("FAlSE".co_to_bool(strict: true)).to be false
      expect("f".co_to_bool(strict: true)).to be false
      expect("F".co_to_bool(strict: true)).to be false
      expect("0".co_to_bool(strict: true)).to be false
      expect("".co_to_bool(strict: true)).to be false
      expect("    ".co_to_bool(strict: true)).to be false
    end
    it 'throws an error when not true and not strictly "false"' do
      expect{ "blah".co_to_bool(strict: true) }.to raise_error(ArgumentError)
    end
  end
end
