describe USI::Resource::Score do
  describe '#cp' do
    let(:score) { USI::Resource::Score.new(args) }

    context '`cp` is included' do
      let(:args) { ["cp", "-1521"] }

      it "returns the cp(centi pawn) value on Fixnum" do
        expect(score.cp).to eq -1521
      end
    end

    context '`cp` is not included' do
      let(:args) { ["mate", "+"] }

      it do
        expect(score.cp).to be nil
      end
    end

    context '`lowerbound` or `upperbound` is included' do
      let(:args) { ["cp", "-9999", "lowerbound"] }

      it "returns the cp(centi pawn) value on Fixnum" do
        expect(score.cp).to eq -9999
      end
    end
  end
end
