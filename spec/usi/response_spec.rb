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
end
