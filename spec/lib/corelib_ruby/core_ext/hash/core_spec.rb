RSpec.describe Hash do
  describe "#not_empty?" do
    it "works" do
      expect({}.co_not_empty?).to be false
      expect({key: :value}.co_not_empty?).to be true
    end
  end
end
