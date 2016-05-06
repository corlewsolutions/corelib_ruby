RSpec.describe NilClass do
  describe "#not_nil?" do
    it 'works' do
      expect(nil.co_not_nil?).to be false
    end
  end

  describe "#to_yes_no" do
    it 'converts correctly with no options' do
      expect(nil.co_to_yes_no).to eq("")
    end
    it 'converts correctly with if_nil option' do
      expect(nil.co_to_yes_no(if_nil: "Unspecified")).to eq("Unspecified")
    end
  end
end

