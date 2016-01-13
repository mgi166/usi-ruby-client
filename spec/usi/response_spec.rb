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

  describe '#name' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `id name`' do
      let(:output) { "id name Apery Debug Build" }

      it do
        expect(response.name).to eq "Apery Debug Build"
      end
    end

    context 'when output does not include `id name`' do
      let(:output) { "id author hoge\nusiok" }

      it do
        expect(response.name).to be nil
      end
    end
  end

  describe '#author' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `id author`' do
      let(:output) { "id author Hiraoka Takuya" }

      it do
        expect(response.author).to eq "Hiraoka Takuya"
      end
    end

    context 'when output does not include `id author`' do
      let(:output) { "id name hoge\nusiok" }

      it do
        expect(response.author).to be nil
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
end
