describe USI::Response do
  describe '#usiok?' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `usiok`' do
      let(:output) do
        <<-EOS
id name Apery
id author Hiraoka Takuya
usiok
        EOS
      end

      it do
        expect(response.usiok?).to be true
      end
    end

    context 'when output does not include `usiok`' do
      let(:output) do
        ""
      end

      it do
        expect(response.usiok?).to be false
      end
    end
  end

  describe '#id' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `id`' do
      let(:output) { "id name Apery Debug Build\nid author Hiraoka Takuya" }

      it do
        expect(response.id).to be_instance_of USI::Resource::Id
      end

      it '`id name` is included, id has `name` attributes' do
        expect(response.id.name).to eq "Apery Debug Build"
      end

      it '`id author` is included, id has `author` attributes' do
        expect(response.id.name).to eq "Apery Debug Build"
      end
    end

    context 'when output does not include `id`' do
      let(:output) { "option name author hoge" }

      it do
        expect(response.id).to be nil
      end
    end
  end

  describe '#option' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `option name xxx type yyy zzz`' do
      context 'a single option' do
        let(:output) { "option name Best_Book_Move type check default false" }

        it do
          expect(response.option).to eq({ "Best_Book_Move" => { type: "check", params: "default false" }})
        end
      end

      context 'multiple options' do
        let(:output) do
          <<-EOS
option name Hash type button
option name Emergency type spin default 200 min 0 max 30000
option name Eval_Dir type string default 20151105
          EOS
        end

        it do
          expect(response.option).to eq(
            {
              "Hash" => { type: "button", params: nil },
              "Emergency" => { type: "spin", params: "default 200 min 0 max 30000" },
              "Eval_Dir" => { type: "string", params: "default 20151105" },
            }
          )
        end
      end
    end

    context 'when output does not includes `option name xxx type yyy zzz`' do
      let(:output) { "id author hoge" }

      it do
        expect(response.option).to eq({})
      end
    end
  end

  describe '#ready?' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `readyok`' do
      let(:output) { "readyok" }

      it do
        expect(response.ready?).to be true
      end
    end

    context 'when output does not include `readyok`' do
      let(:output) { "id author hoge" }

      it do
        expect(response.ready?).to be false
      end
    end
  end

  describe '#game_result' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `bestmove resign|win`' do
      context 'resign' do
        let(:output) { "bestmove resign" }

        it do
          expect(response.game_result).to eq "resign"
        end
      end

      context 'win' do
        let(:output) { "bestmove win" }

        it do
          expect(response.game_result).to eq "win"
        end
      end
    end

    context 'when output does not include `bestmove resign|win`' do
      let(:output) { "id author hoge" }

      it do
        expect(response.game_result).to eq nil
      end
    end
  end

  describe '#best_move, #ponder' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `bestmove xxxx`' do
      let(:output) { "bestmove 8c8d" }

      it do
        expect(response.best_move).to eq "8c8d"
      end
    end

    context 'when output includes `bestmove xxxx ponder yyyy`' do
      let(:output) { "bestmove 8c8d ponder None" }

      it do
        expect(response.best_move).to eq "8c8d"
        expect(response.ponder).to eq "None"
      end
    end
  end
end
