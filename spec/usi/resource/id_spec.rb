describe USI::Resource::Id do
  describe '.create' do
    context 'return value' do
      let(:args) { "name hoge" }

      it do
        expect(USI::Resource::Id.create(args)).to be_instance_of USI::Resource::Id
      end
    end

    context '`name` is included in arguments' do
      let(:args) { "name hoge" }

      it "`name` is the value specified an argument" do
        expect(
          USI::Resource::Id.create(args).name
        ).to eq "hoge"
      end
    end

    context '`author` is included in arguments' do
      let(:args) { "author fuga" }

      it "`author` is the value specified an argument" do
        expect(
          USI::Resource::Id.create(args).author
        ).to eq "fuga"
      end
    end

    context '`name` or `author` does not includ in arguments' do
      let(:args) { "aaa bbbb" }

      it do
        skip "TODO: Not determing"
      end
    end

    context 'many spaces is included' do
      let(:args) { "name       aaa bb  ccc" }

      it "ignores after `name` spaces" do
        expect(
          USI::Resource::Id.create(args).name
        ).to eq "aaa bb  ccc"
      end
    end
  end
end
