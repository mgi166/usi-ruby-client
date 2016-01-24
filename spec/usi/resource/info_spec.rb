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
end
