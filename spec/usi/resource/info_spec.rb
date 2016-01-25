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

  describe '#nodes' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["nodes", "135125"]] }

    it "returns the number of nodes" do
      expect(subject.nodes).to eq 135125
    end
  end

  describe '#pv' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["pv", "3a3b", "L*4h", "4c4d"]] }

    it do
      expect(subject.pv).to be_instance_of Array
    end

    it "returns principal variations" do
      expect(subject.pv).to eq %w(3a3b L*4h 4c4d)
    end
  end

  describe '#hashfull' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["hashfull", "104"]] }

    it "returns the number of hashfull" do
      expect(subject.hashfull).to eq 104
    end
  end

  describe '#nps' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["nps", "116391"]] }

    it "returns the number of nps" do
      expect(subject.nps).to eq 116391
    end
  end

  describe '#string' do
    subject { USI::Resource::Info.new(args) }

    let(:args) { [["string", "7g7f", "(70%)"]] }

    it "returns the string for display on GUI" do
      expect(subject.string).to eq "7g7f (70%)"
    end
  end

  describe '#score' do
    subject { USI::Resource::Info.new(args) }

    context 'single score' do
      let(:args) { [["score", "cp", "-1521"]] }

      it do
        expect(subject.score).to be_instance_of USI::Resource::Score
      end

      it "score has an attribute" do
        expect(subject.score.cp).to eq -1521
      end
    end

    context 'multipul scores' do
      let(:args) { [["score", "cp", "-1521"], ["score", "mate", "+"]] }

      it do
        expect(subject.score).to be_instance_of USI::Resource::Score
      end

      it "score has attributes" do
        expect(subject.score.cp).to eq -1521
        expect(subject.score.mate).to eq "+"
      end
    end
  end
end
