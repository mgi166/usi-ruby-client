describe USI::Resource::Bestmove do
  describe '.parse' do
    context 'does not include `ponder`' do
      subject { USI::Resource::Bestmove.parse(args) }

      let(:args) { "8c8d" }

      it do
        is_expected.to eq ["8c8d", nil]
      end
    end

    context 'includes `ponder`' do
      subject { USI::Resource::Bestmove.parse(args) }

      let(:args) { "8c8d ponder None" }

      it do
        is_expected.to eq ["8c8d", "ponder" => "None"]
      end
    end

    context 'includes `ponder` multiple values' do
      subject { USI::Resource::Bestmove.parse(args) }

      let(:args) { "8c8d ponder 3a2b 8c7d" }

      it do
        is_expected.to eq ["8c8d", "ponder" => "3a2b 8c7d"]
      end
    end
  end
end
