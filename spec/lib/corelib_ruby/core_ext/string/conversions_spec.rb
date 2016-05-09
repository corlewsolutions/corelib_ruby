RSpec.describe String do
  context "#concat_with" do
    it 'appends correctly' do
      expect("".cl_concat_with("test")).to eq("test")
      expect("".cl_concat_with("test",",")).to eq("test")
      expect("my".cl_concat_with("test")).to eq("mytest")
      expect("my".cl_concat_with("test",",")).to eq("my,test")
    end
    it 'does not append separators with nil or empty strings' do
      expect("my".cl_concat_with("",",")).to eq("my")
      expect("my".cl_concat_with(nil,",")).to eq("my")
      expect("".cl_concat_with("",",")).to eq("")
      expect("".cl_concat_with(nil,",")).to eq("")
    end
    it 'does not create a new string' do
      str = ""
      str_id = str.object_id
      expect(str.cl_concat_with("test").object_id).to eq(str_id)
    end
  end

  describe "#cl_combine" do
    it 'defaults work' do
      expect("test".cl_combine("test2")).to eq("test test2")
      expect("".cl_combine("test2")).to eq("test2")
      expect("test".cl_combine("")).to eq("test")
      expect("test".cl_combine("me", "out")).to eq("test me out")
    end
    it "setting prefix & suffix works" do
      expect("test".cl_combine("me", :prefix => "(")).to eq("(test me")
      expect("test".cl_combine("me", :suffix => ")")).to eq("test me)")
      expect("test".cl_combine("me", :prefix => "(", :suffix => ")")).to eq("(test me)")
      expect("test".cl_combine("me", :prefix => "(", :suffix => ")", :wrap => false)).to eq("test me")
    end
    it "if_empty option works" do
      expect("".cl_combine("", :if_empty => "-")).to eq("-")
    end
  end

  context "#cl_to_yes_no" do
    it 'converts correctly with no options' do
      expect("false".cl_to_yes_no).to eq"No"
      expect("FALSE".cl_to_yes_no).to eq("No")
      expect("  FALSE  ".cl_to_yes_no).to eq("No")
      expect("f".cl_to_yes_no).to eq("No")
      expect("F".cl_to_yes_no).to eq("No")
      expect("".cl_to_yes_no).to eq("No")
      expect("   ".cl_to_yes_no).to eq("No")
      expect("0".cl_to_yes_no).to eq("No")
      expect("true".cl_to_yes_no).to eq("Yes")
      expect("TRUE".cl_to_yes_no).to eq("Yes")
      expect("t".cl_to_yes_no).to eq("Yes")
      expect("T".cl_to_yes_no).to eq("Yes")
      expect("1".cl_to_yes_no).to eq("Yes")
      expect("  1  ".cl_to_yes_no).to eq("Yes")
    end
  end

  context "#cl_force_leading_space" do
    it "works correctly with defaults" do
      expect("".cl_force_leading_space).to eq("")
      expect("Test".cl_force_leading_space).to eq(" Test")
      expect(" Test".cl_force_leading_space).to eq(" Test")
      expect("       Test".cl_force_leading_space).to eq(" Test")
      expect("       Test  ".cl_force_leading_space).to eq(" Test  ")
      expect("   ".cl_force_leading_space).to eq("   ")
    end
    it "works correctly when even_when_empty: true" do
      expect("".cl_force_leading_space(even_when_empty: true)).to eq(" ")
      expect("Test".cl_force_leading_space(even_when_empty: true)).to eq(" Test")
      expect(" Test".cl_force_leading_space(even_when_empty: true)).to eq(" Test")
      expect("       Test".cl_force_leading_space(even_when_empty: true)).to eq(" Test")
      expect("       Test  ".cl_force_leading_space(even_when_empty: true)).to eq(" Test  ")
      expect("   ".cl_force_leading_space(even_when_empty: true)).to eq("   ")
    end
  end

  describe "#to_bool" do
    it 'converts to true correctly' do
      expect("true".cl_to_bool).to be true
      expect("TRUE".cl_to_bool).to be true
      expect("t".cl_to_bool).to be true
      expect("T".cl_to_bool).to be true
      expect("1".cl_to_bool).to be true
      expect("yes".cl_to_bool).to be true
      expect("YES".cl_to_bool).to be true
    end
    it 'converts to false correctly in unstrict mode' do
      expect("false".cl_to_bool).to be false
      expect("r".cl_to_bool).to be false
      expect("0".cl_to_bool).to be false
      expect("Chuck Norris".cl_to_bool).to be false
      expect("".cl_to_bool).to be false
    end
    it 'converts correctly when using no_strip' do
      expect("false".cl_to_bool(strip: false)).to be false
      expect("true".cl_to_bool(strip: false)).to be true
      expect("true  ".cl_to_bool(strip: false)).to be false
      expect("  1  ".cl_to_bool(strip: false)).to be false
    end
    it 'converts to false correctly in strict mode' do
      expect("false".cl_to_bool(strict: true)).to be false
      expect("FAlSE".cl_to_bool(strict: true)).to be false
      expect("f".cl_to_bool(strict: true)).to be false
      expect("F".cl_to_bool(strict: true)).to be false
      expect("0".cl_to_bool(strict: true)).to be false
      expect("".cl_to_bool(strict: true)).to be false
      expect("    ".cl_to_bool(strict: true)).to be false
    end
    it 'throws an error when not true and not strictly "false"' do
      expect{ "blah".cl_to_bool(strict: true) }.to raise_error(ArgumentError)
    end
  end
end
