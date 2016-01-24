describe USI::Resource::Checkmate do
  describe '.parse' do
    context 'implemented checkmate puzzle' do
      subject { USI::Resource::Checkmate.parse(args) }

      let(:args) { "G*8f 9f9g 8f8g 9g9h 8g8h" }

      it do
        is_expected.to eq [%w(G*8f 9f9g 8f8g 9g9h 8g8h), nil]
      end
    end

    context 'not implemented checkmate puzzle' do
      subject { USI::Resource::Checkmate.parse(args) }

      let(:args) { "notimplemented" }

      it do
        is_expected.to eq [[], "notimplemented"]
      end
    end
  end
end
