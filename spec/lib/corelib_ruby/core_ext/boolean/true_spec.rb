RSpec.describe TrueClass do
  describe "#to_yes_no" do
    it 'converts correctly with default options' do
      expect(true.co_to_yes_no).to eq("Yes")
    end
    it 'converts correctly when if_no is set' do
      expect(true.co_to_yes_no(if_yes: "yes way")).to eq("yes way")
    end
  end
end
