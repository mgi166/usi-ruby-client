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
end
