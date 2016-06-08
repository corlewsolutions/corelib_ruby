RSpec.describe TrueClass do
  describe "#to_yes_no" do
    it 'converts correctly with default options' do
      expect(true.cl_to_yes_no).to eq("Yes")
    end

    it 'converts correctly when if_no is set' do
      expect(true.cl_to_yes_no(if_yes: "yes way")).to eq("yes way")
    end

    it 'is aliased' do
      expect(true._to_yes_no).to eq("Yes")
    end
  end

  describe "#cl_to_bool" do
    it 'converts correctly' do
      expect(true.cl_to_bool).to be true
    end

    it 'is aliased' do
      expect(true._to_bool).to be true
    end
  end
end
