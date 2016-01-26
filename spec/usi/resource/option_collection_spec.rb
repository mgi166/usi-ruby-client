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
end
