RSpec.describe FalseClass do
  describe "#cl_to_yes_no" do
    it 'converts correctly with default options' do
      expect(false.cl_to_yes_no).to eq("No")
    end
    it 'converts correctly when if_no is set' do
      expect(false.cl_to_yes_no(if_no: "no way")).to eq("no way")
    end

    it 'is aliased' do
      expect(false._to_yes_no).to eq("No")
    end
  end

  describe "#cl_to_bool" do
    it 'converts correctly' do
      expect(false.cl_to_bool).to be false
    end

    it 'is aliased' do
      expect(false._to_bool).to be false
    end
  end
end
