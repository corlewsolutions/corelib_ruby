RSpec.describe Hash do
  describe "#cl_each_with_last_flag" do
    let(:result) {[]}

    it 'works with empty hash' do
      {}.cl_each_with_last_flag {|key, value, is_last| result.concat([key, value]) if is_last}
      expect(result).to eq([])
    end

    it 'works with non empty hash' do
      hash = {first: "1st", second: "2nd", third: "3rd"}
      hash.cl_each_with_last_flag {|key, value, is_last| result.concat([key, value]) if is_last}
      expect(result).to eq([:third, "3rd"])
    end

    it 'is aliased' do
      {}._each_with_last_flag {|key, value, is_last| result.concat([key, value]) if is_last}
      expect(result).to eq([])
    end
  end
end
