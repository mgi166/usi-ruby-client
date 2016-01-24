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

  describe '#mate' do
    let(:score) { USI::Resource::Score.new(args) }

    context '`mate` is included' do
      let(:args) { ["mate", "+"] }

      it "returns the mate value" do
        expect(score.mate).to eq "+"
      end
    end

    context '`mate` is not included' do
      let(:args) { ["cp", "-1521"] }

      it do
        expect(score.mate).to be nil
      end
    end
  end

  describe '#upperbound?' do
    let(:score) { USI::Resource::Score.new(args) }

    context '`upperbound` is included' do
      let(:args) { ["cp", "9999", "upperbound"] }

      it do
        expect(score.upperbound?).to be true
      end
    end

    context '`upperbound` is not included' do
      let(:args) { ["cp", "-1521"] }

      it do
        expect(score.upperbound?).to be false
      end
    end
  end

  describe '#lowerbound?' do
    let(:score) { USI::Resource::Score.new(args) }

    context '`lowerbound` is included' do
      let(:args) { ["cp", "-9999", "lowerbound"] }

      it do
        expect(score.lowerbound?).to be true
      end
    end

    context '`lowerbound` is not included' do
      let(:args) { ["cp", "-1521"] }

      it do
        expect(score.lowerbound?).to be false
      end
    end
  end
end
