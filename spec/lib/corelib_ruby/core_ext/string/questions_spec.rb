RSpec.describe String do
  context "#cl_all_spaces?" do
    it "returns correct values when no options present" do
      expect("This is a test".cl_all_spaces?).to eq(false)
      expect("     ".cl_all_spaces?).to eq(true)
      expect("    \n ".cl_all_spaces?).to eq(false)
      expect("".cl_all_spaces?).to eql(false)
    end

    it "returns correct values when when_empty: false" do
      expect("This is a test".cl_all_spaces?(when_empty: false)).to eq(false)
      expect("     ".cl_all_spaces?(when_empty: false)).to eq(true)
      expect("    \n ".cl_all_spaces?(when_empty: false)).to eq(false)
      expect("".cl_all_spaces?(when_empty: false)).to eql(false)
    end

    it "returns correct values when when_empty: set" do
      expect("This is a test".cl_all_spaces?(when_empty: true)).to eq(false)
      expect("     ".cl_all_spaces?(when_empty: true)).to eq(true)
      expect("    \n ".cl_all_spaces?(when_empty: true)).to eq(false)
      expect("".cl_all_spaces?(when_empty: true)).to eql(true)
    end

    it "is aliased" do
      expect(""._all_spaces?).to eql(false)
    end
  end

  context "#cl_all_digits?" do
    it "returns false when empty" do
     expect("".cl_all_digits?).to be false
    end

    it "returns true when all digits" do
      expect("123".cl_all_digits?).to be true
    end

    it "returns false when not digits" do
      expect("123a".cl_all_digits?).to be false
      expect("ABC".cl_all_digits?).to be false
      expect("   ".cl_all_digits?).to be false
      expect(" 132  ".cl_all_digits?).to be false
      expect("  0  ".cl_all_digits?).to be false
      expect("123\n134".cl_all_digits?).to be false
      expect("123\nabc".cl_all_digits?).to be false
      expect("abc\n123".cl_all_digits?).to be false
      expect("abc\n".cl_all_digits?).to be false
      expect("123\n".cl_all_digits?).to be false
      expect("123\r".cl_all_digits?).to be false
      expect("123\f".cl_all_digits?).to be false
    end

    it "returns correctly when if_empty is set and string is empty" do
      expect("".cl_all_digits?(if_empty: false)).to be false
      expect("".cl_all_digits?(if_empty: true)).to be true
    end

    it "is aliased" do
      expect("987"._all_digits?).to be true
    end
  end

  context "#cl_all_letters?" do
    it "returns false when empty" do
     expect("".cl_all_letters?).to be false
    end

    it "returns true when only letters" do
      expect("ABC".cl_all_letters?).to be true
      expect("abc".cl_all_letters?).to be true
    end

    it "returns false when not just letters" do
      expect("123a".cl_all_letters?).to be false
      expect("a123".cl_all_letters?).to be false
      expect("   ".cl_all_letters?).to be false
      expect(" a  ".cl_all_letters?).to be false
      expect("Z  ".cl_all_letters?).to be false
      expect("abc\nABC".cl_all_letters?).to be false
      expect("ABC\n123".cl_all_letters?).to be false
      expect("123\nABC".cl_all_letters?).to be false
      expect("123\n".cl_all_letters?).to be false
      expect("abc\n".cl_all_letters?).to be false
      expect("abc\r".cl_all_letters?).to be false
      expect("abc\f".cl_all_letters?).to be false
    end

    it "returns correctly when if_empty is set and string is empty" do
      expect("".cl_all_letters?(if_empty: false)).to be false
      expect("".cl_all_letters?(if_empty: true)).to be true
    end

    it "is aliased" do
      expect("ABC"._all_letters?).to be true
    end
  end
end
