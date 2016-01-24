describe USI::Resource::Info do
  describe '.parse' do
    context 'single subcommand' do
      subject { USI::Resource::Info.parse(args) }

      let(:args) { "nodes 120000" }

      it do
        is_expected.to eq [["nodes", "120000"]]
      end
    end

    context 'multipul subcommands' do
      subject { USI::Resource::Info.parse(args) }

      context 'includes `pv`' do
        let(:args) do
          "time 1141 depth 3 nodes 135125 score cp -1521 pv 3a3b L*4h 4c4d"
        end

        it do
          is_expected.to eq [
                           ["time", "1141"],
                           ["depth", "3"],
                           ["nodes", "135125"],
                           ["score", "cp", "-1521"],
                           ["pv", "3a3b", "L*4h", "4c4d"]
                         ]
        end
      end

      context 'includes `string`' do
        let(:args) { "string 7g7f (70%) time 1000" }

        it do
          is_expected.to eq [["string", "7g7f", "(70%)"], ["time", "1000"]]
        end
      end
    end
  end

  describe '#depth' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["depth", "3"]] }

    it "returns the depth" do
      expect(subject.depth).to eq 3
    end
  end

  describe '#seldepth' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["depth", "5"], ["seldepth", "8"]] }

    it "returns the seldepth(this means selected depth)" do
      expect(subject.seldepth).to eq 8
    end
  end

  describe '#time' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["time", "1141"]] }

    it "returns the time of milisecond" do
      expect(subject.time).to eq 1141
    end
  end
end
