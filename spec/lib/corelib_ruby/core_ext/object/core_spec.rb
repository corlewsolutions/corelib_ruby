RSpec.describe Object do
  describe "#cl_not_nil?" do
    it 'works' do
      expect([].cl_not_nil?).to be true
    end

    it 'is aliased' do
      expect([]._not_nil?).to be true
    end
  end
end
