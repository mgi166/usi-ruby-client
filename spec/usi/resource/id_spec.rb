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

  describe '#update' do
    context 'name' do
      let(:id) { USI::Resource::Id.new("author" => "Einstein") }

      context 'does not set' do
        it "set new name" do
          id.update("name brownian motion")
          expect(id.name).to eq "brownian motion"
        end
      end

      context 'already set' do
        before do
          id.name = "brownian motion"
        end

        it "update name" do
          id.update("name random work")
          expect(id.name).to eq "random work"
        end
      end
    end

    context 'author' do
      let(:id) { USI::Resource::Id.new("name" => "A") }

      context 'does not set' do
        it "set new author" do
          id.update("author B")
          expect(id.author).to eq "B"
        end
      end

      context 'already set' do
        before do
          id.author = "C"
        end

        it "Update author" do
          id.update("author D")
          expect(id.author).to eq "D"
        end
      end
    end
  end
end
