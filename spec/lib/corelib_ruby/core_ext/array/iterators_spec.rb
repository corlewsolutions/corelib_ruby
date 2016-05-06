RSpec.describe Hash do
  describe "#co_each_with_last_flag" do
    it 'works with empty hash' do
      result = []
      [].co_each_with_last_flag {|item, is_last| result << item if is_last}
      expect(result).to eq([])
    end
    it 'works with non empty hash' do
      result = []
      ["1st", "2nd", "3rd"].co_each_with_last_flag {|item, is_last| result << item if is_last}
      expect(result).to eq(["3rd"])
    end
  end
end
