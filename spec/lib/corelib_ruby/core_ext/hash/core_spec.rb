RSpec.describe Hash do
  describe "#not_empty?" do
    it "works" do
      expect({}.cl_not_empty?).to be false
      expect({key: :value}.cl_not_empty?).to be true
    end
  end
end
