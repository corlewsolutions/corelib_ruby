RSpec.describe NilClass do
  describe "#cl_not_nil?" do
    it 'works' do
      expect(nil.cl_not_nil?).to be false
    end

    it 'is aliased' do
      expect(nil._not_nil?).to be false
    end
  end

  describe "#cl_to_yes_no" do
    it 'converts correctly with no options' do
      expect(nil.cl_to_yes_no).to eq("")
    end

    it 'converts correctly with if_nil option' do
      expect(nil.cl_to_yes_no(if_nil: "Unspecified")).to eq("Unspecified")
    end

    it 'is aliased' do
      expect(nil._to_yes_no).to eq("")
    end
  end

  describe "#cl_combine" do
    it 'converts correctly with no options' do
      expect(nil.cl_combine("foo")).to eq("foo")
    end

    it 'converts correctly with if_nil option' do
      expect(nil.cl_combine("", if_empty: "Unspecified")).to eq("Unspecified")
      expect(nil.cl_combine("yo", prefix: "(", suffix: ")")).to eq("(yo)")
    end

    it 'is aliased' do
      expect(nil._combine("foo")).to eq("foo")
    end
  end
end

