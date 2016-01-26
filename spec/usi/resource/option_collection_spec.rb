describe USI::Resource::OptionCollection do
  describe '.create' do
    subject { USI::Resource::OptionCollection.create(args) }

    let(:args) { "name ResetLearning type button" }

    it do
      is_expected.to be_instance_of USI::Resource::OptionCollection
    end

    it "creates USI::Resource::Option instance, and store in self" do
      expect(subject.options['ResetLearning']).to be_instance_of USI::Resource::Option
    end
  end

  describe '#update' do
    let(:collection) { USI::Resource::OptionCollection.new(option) }
    let(:option) { USI::Resource::Option.create("name ResetLearning type button") }

    context 'receive new option' do
      let(:args) { "name Best_Book_Move type check default false" }

      it "create new option, and cache" do
        collection.update(args)
        expect(collection.options.keys).to eq %w(ResetLearning Best_Book_Move)
      end
    end

    context 'receive exists option' do
      let(:args) { "name ResetLearning type spin" }

      it "override this option" do
        collection.update(args)
        expect(collection.options.keys).to eq %w(ResetLearning)
        expect(collection['ResetLearning'].type).to eq "spin"
      end
    end
  end
end
