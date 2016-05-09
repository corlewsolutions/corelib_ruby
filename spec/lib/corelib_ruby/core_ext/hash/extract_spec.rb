RSpec.describe Hash do
  describe "#cl__extract" do
    context "returns" do
      it 'the value when key is present' do
        hash = { one: 1, two: 2 }
        expect(hash.cl_extract(:one)).to eql(1)
        expect(hash).to eql(two: 2)
      end

      it 'the value when key and default are present' do
        hash = { one: 1, two: 2 }
        expect(hash.cl_extract(:one, 3)).to eql(1)
        expect(hash).to eql(two: 2)
      end

      it 'the default when key is not present' do
        hash = { one: 1, two: 2 }
        expect(hash.cl_extract(:three, 3)).to eql(3)
        expect(hash).to eql(one: 1, two: 2)
      end

      it 'is aliased' do
        hash = { one: 1, two: 2 }
        expect(hash._extract(:one)).to eql(1)
        expect(hash).to eql(two: 2)
      end
    end

    context 'yields' do
      let(:hash) {{ one: 1, two: 2 }}
      it "when key is missing and no default is given" do
        expect { |arg| hash.cl_extract(:three, &arg) }.to yield_with_args(:three)
      end

      it "when key is missing and default is given" do
        expect { |arg| hash.cl_extract(:three, 3, &arg) }.to yield_with_args(:three)
      end
    end

    context "raises" do
      let(:hash) {{ one: 1, two: 2 }}

      it 'ArgumentError when no arguments given' do
        expect { hash.cl_extract }.to raise_exception(ArgumentError)
      end
      it 'ArgumentError when 3 or more arugments are given' do
        expect { hash.cl_extract(1, 2, 3) }.to raise_exception(ArgumentError)
      end
      it 'KeyError when key is missing and no default is given' do
        expect { hash.cl_extract(:three) }.to raise_exception(KeyError)
      end
    end
  end
end
