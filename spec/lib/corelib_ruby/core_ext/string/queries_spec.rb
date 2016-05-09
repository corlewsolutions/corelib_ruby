RSpec.describe String do
  context "#cl_first_words" do
    it "returns correct values when a limiter is given" do
      expect("This is a test".cl_first_words(0)).to eq("")
      expect("This is a test".cl_first_words(2)).to eq("This is")
      expect("This is a test".cl_first_words(4)).to eq("This is a test")
    end
    it "returns correct values when limiter is given and ellipses: set" do
      expect("".cl_first_words(0, ellipses: true)).to eq("")
      expect("".cl_first_words(0, ellipses: " +++")).to eq("")
      expect("This is a test".cl_first_words(2, ellipses: true)).to eq("This is ...")
      expect("This is a test".cl_first_words(2, ellipses: " +++")).to eq("This is +++")
      expect("This is a test".cl_first_words(4, ellipses: true)).to eq("This is a test")
      expect("This is a test".cl_first_words(4, ellipses: " +++")).to eq("This is a test")
    end
    it "returns correct values when no limiter is given" do
      expect("".cl_first_words).to eq("")
      expect("This is a test".cl_first_words).to eq("This is a test")
    end
    it "returns correct values when no limiter is given and ellipses: set" do
      expect("".cl_first_words(nil, ellipses: true)).to eq("")
      expect("This is a test".cl_first_words(nil, ellipses: true)).to eq("This is a test")
    end
  end

  context "#cl_index_of_next_space" do
    it 'calculates correctly with no trailing whitespace' do
      str = "This is string"
      expect(str.cl_index_of_next_space).to eq(4)
      expect(str.cl_index_of_next_space(0)).to eq(4)
      expect(str.cl_index_of_next_space(5)).to eq(7)
      expect(str.cl_index_of_next_space(8)).to eq(14)
    end
    it 'calculates correctly with trailing whitespace' do
      str = "This is string  "
      expect(str.cl_index_of_next_space(10)).to eq(14)
      expect(str.cl_index_of_next_space(14)).to eq(15)
    end
  end
end
