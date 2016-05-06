RSpec.describe Array do
  describe "#co_delete!" do
    let(:array) {[:this_exists, false, nil]}

    it "raises ArgumentError when the object to delete isn't present" do
      expect { array.co_delete!(:not_present) }.to raise_error(ArgumentError)
    end

    it "deletes correctly" do
      array.co_delete!(:this_exists)
      expect(array).to eq([false, nil])
      array.co_delete!(false)
      expect(array).to eq([nil])
      array.co_delete!(nil)
      expect(array).to eq([])
    end

    it "returns the deleted item" do
      expect(array.co_delete!(:this_exists)).to eq(:this_exists)
      expect(array.co_delete!(nil)).to eq(nil)
    end
  end
end
