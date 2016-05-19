RSpec.describe Hash do
  describe "#cl_not_empty?" do
    it "works" do
      expect({}.cl_not_empty?).to be false
      expect({key: :value}.cl_not_empty?).to be true
    end

    it "is aliased" do
      expect({}._not_empty?).to be false
    end
  end

  describe "cl_add_if_absent" do
    it "works" do
      hash = {}
      hash.cl_add_if_absent("key", :end)
      expect(hash).to eq({"key" => :end})

      hash = {"key" => :start}
      hash.cl_add_if_absent("key", :end)
      expect(hash).to eq({"key" => :start})
    end

    it "returns existing value from hash if present" do
      hash = {"key" => :start}
      expect(hash.cl_add_if_absent("key", :end)).to eq(:start)
    end

    it "returns new value from hash if absent" do
      hash = {}
      expect(hash.cl_add_if_absent("key", :end)).to eq(:end)
    end

    it "is aliased" do
      hash = {}
      hash._add_if_absent("key", :end)
      expect(hash).to eq({"key" => :end})
    end
  end

  describe "cl_update_if_present" do
    it "works" do
      hash = {}
      hash.cl_update_if_present("key", :end)
      expect(hash).to eq({})

      hash = {"key" => :start}
      hash.cl_update_if_present("key", :end)
      expect(hash).to eq({"key" => :end})
    end

    it "returns nil if key doesn't exist" do
      hash = {}
      expect(hash.cl_update_if_present("key2", :end)).to eq(nil)
    end

    it "returns new value from hash if present" do
      hash = {"key" => :start}
      expect(hash.cl_update_if_present("key", :end)).to eq(:end)
    end

    it "is aliased" do
      hash = {}
      hash._update_if_present("key", :end)
      expect(hash).to eq({})
    end
  end

end
