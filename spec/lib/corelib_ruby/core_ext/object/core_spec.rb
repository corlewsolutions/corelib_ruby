RSpec.describe Object do
  describe "#co_not_nil?" do
    it 'works' do
      expect([].co_not_nil?).to be true
    end
  end
end
