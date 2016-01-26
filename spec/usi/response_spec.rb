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
          expect(response.option).to be_instance_of USI::Resource::OptionCollection
        end

        it "OptionCollection#[] returns Resource::Option instance" do
          expect(response.option['Best_Book_Move']).to be_instance_of USI::Resource::Option
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

        it "Store all options" do
          option = response.option
          expect(option.keys).to eq %w(Hash Emergency Eval_Dir)
        end
      end
    end

    context 'when output does not includes `option name xxx type yyy zzz`' do
      let(:output) { "id author hoge" }

      it do
        expect(response.option).to be nil
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

  describe '#bestmove' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `bestmove xxxx`' do
      let(:output) { "bestmove 8c8d" }

      it do
        expect(response.bestmove).to be_instance_of USI::Resource::Bestmove
      end

      it 'bestmove has `bestmove` attributes' do
        expect(response.bestmove.bestmove).to eq "8c8d"
      end
    end

    context 'when output includes `bestmove xxxx ponder yyyy`' do
      let(:output) { "bestmove 8c8d ponder None" }

      it do
        expect(response.bestmove).to be_instance_of USI::Resource::Bestmove
      end

      it 'bestmove has `bestmove`, `ponder` attributes' do
        expect(response.bestmove.bestmove).to eq "8c8d"
        expect(response.bestmove.ponder).to eq "None"
      end
    end
  end

  describe '#checkmate' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `checkmate xxxx`' do
      let(:output) { "checkmate G*8f 9f9g 8f8g 9g9h 8g8h" }

      it do
        expect(response.checkmate).to be_instance_of USI::Resource::Checkmate
      end

      it "checkmate has `move` attributes" do
        expect(response.checkmate.move).to eq %w(G*8f 9f9g 8f8g 9g9h 8g8h)
      end
    end

    context 'when output does not include `checkmate xxxx`' do
      let(:output) { "bestmove 8c8d ponder None" }

      it do
        expect(response.checkmate).to be nil
      end
    end
  end

  describe '#info' do
    let(:response) { USI::Response.new(output) }

    context 'when output includes `info xxxx`' do
      let(:output) { "info nodes 120000 nps 116391" }

      it do
        expect(response.info).to be_instance_of USI::Resource::Info
      end

      it "info has some attributes" do
        expect(response.info.nodes).to eq 120000
        expect(response.info.nps).to eq 116391
      end
    end

    context 'when output does not include `info xxxx`' do
      let(:output) { "id author hoge" }

      it do
        expect(response.info).to be nil
      end
    end
  end
end
