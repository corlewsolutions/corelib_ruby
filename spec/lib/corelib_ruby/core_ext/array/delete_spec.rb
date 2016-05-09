RSpec.describe Array do
  describe "#cl_delete!" do
    let(:array) {[:this_exists, false, nil]}

    it "raises ArgumentError when the object to delete isn't present" do
      expect { array.cl_delete!(:not_present) }.to raise_error(ArgumentError)
    end

    it "deletes correctly" do
      array.cl_delete!(:this_exists)
      expect(array).to eq([false, nil])
      array.cl_delete!(false)
      expect(array).to eq([nil])
      array.cl_delete!(nil)
      expect(array).to eq([])
    end

    it "returns the deleted item" do
      expect(array.cl_delete!(:this_exists)).to eq(:this_exists)
      expect(array.cl_delete!(nil)).to eq(nil)
    end

    it "is aliased" do
      array._delete!(:this_exists)
      expect(array).to eq([false, nil])
    end
  end
end
