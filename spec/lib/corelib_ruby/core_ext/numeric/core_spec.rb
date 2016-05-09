RSpec.describe Numeric do
  describe "#cl_to_yes_no" do
    it 'works' do
      expect(1.cl_to_yes_no).to eq("Yes")
      expect(1.0.cl_to_yes_no).to eq("Yes")
      expect(0.cl_to_yes_no).to eq("No")
      expect(0.0.cl_to_yes_no).to eq("No")
    end

    it 'is aliased' do
      expect(1._to_yes_no).to eq("Yes") # Test on Fixnum
      expect(1.0._to_yes_no).to eq("Yes") # Test on Float
    end
  end
end
