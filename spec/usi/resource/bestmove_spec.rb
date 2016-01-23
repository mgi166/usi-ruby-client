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

  describe '#bestmove' do
    let(:bestmove) { USI::Resource::Bestmove.new(*args) }

    let(:args) { ["8c8d", "ponder" => "None"] }

    it "returns bestmove position" do
      expect(bestmove.bestmove).to eq "8c8d"
    end
  end

  describe '#ponder' do
    let(:bestmove) { USI::Resource::Bestmove.new(*args) }

    let(:args) { ["8c8d", "ponder" => "None"] }

    it "returns ponder position" do
      expect(bestmove.ponder).to eq "None"
    end
  end

  describe '#resign?' do
    let(:bestmove) { USI::Resource::Bestmove.new(*args) }

    context 'includes `resign`' do
      let(:args) { ["resign", nil] }

      it do
        expect(bestmove.resign?).to be true
      end
    end

    context 'does not include `resign`' do
      let(:args) { ["8c8d", "ponder" => "None"] }

      it do
        expect(bestmove.resign?).to be false
      end
    end
  end
end
