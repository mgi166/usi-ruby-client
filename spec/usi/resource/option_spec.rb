describe USI::Resource::Option do
  describe ".parse" do
    context 'name, type exists' do
      subject { USI::Resource::Option.parse(args) }

      let(:args) { "name ResetLearning type button" }

      it "have some array in array" do
        expect(
          USI::Resource::Option.parse(args)
        ).to eq [["name", "ResetLearning"], ["type", "button"]]
      end
    end

    context 'name, type, default exists' do
      subject { USI::Resource::Option.parse(args) }

      let(:args) { "name Best_Book_Move type check default false" }

      it "have some array in array" do
        expect(
          USI::Resource::Option.parse(args)
        ).to eq [["name", "Best_Book_Move"], ["type", "check"], ["default", "false"]]
      end
    end

    context 'name, type, default, min, max exists' do
      subject { USI::Resource::Option.parse(args) }

      let(:args) { "name Selectivity type spin default 2 min 0 max 4" }

      it "have some array in array" do
        expect(
          USI::Resource::Option.parse(args)
        ).to eq [["name", "Selectivity"], ["type", "spin"], ["default", "2"], ["min", "0"], ["max", "4"]]
      end
    end

    context 'name, type, default, and multiple var exists' do
      subject { USI::Resource::Option.parse(args) }

      let(:args) { "name Style type combo default Normal var Solid var Normal" }

      it "have some array in array" do
        expect(
          USI::Resource::Option.parse(args)
        ).to eq [["name", "Style"], ["type", "combo"], ["default", "Normal"], ["var", "Solid"], ["var", "Normal"]]
      end
    end

    describe 'invalid arguments' do
      context 'single params exists' do
        subject { USI::Resource::Option.parse(args) }

        let(:args) { "name Style type combo default Normal var" }

        it "parse success, but delete isolated params" do
          expect(
            USI::Resource::Option.parse(args)
          ).to eq [["name", "Style"], ["type", "combo"], ["default", "Normal"]]
        end
      end

      context 'name does not exist' do
        subject { USI::Resource::Option.parse(args) }

        let(:args) { "type combo default Normal" }

        it do
          skip "TODO"
        end
      end

      context 'type does not exist' do
        subject { USI::Resource::Option.parse(args) }

        let(:args) { "name Style default Normal" }

        it do
          skip "TODO"
        end
      end
    end
  end

  describe '.new' do
    context 'most simple pattern' do
      subject { USI::Resource::Option.new(args) }

      let(:args) { [["name", "ResetLearning"], ["type", "button"]] }

      it "have `name` attribute" do
        expect(subject.name).to eq "ResetLearning"
      end

      it "have `type` attribute" do
        expect(subject.type).to eq "button"
      end
    end

    context 'type is check' do
      subject { USI::Resource::Option.new(args) }

      let(:args) { [["name", "Best_Book_Move"], ["type", "check"], ["default", "false"]] }

      it "have `name` attribute" do
        expect(subject.name).to eq "Best_Book_Move"
      end

      it "`type` is check" do
        expect(subject.type).to eq "check"
      end

      it "have `default` attribute(boolean)" do
        expect(subject.default).to be false
      end
    end

    context 'type is spin' do
      subject { USI::Resource::Option.new(args) }

      let(:args) { [["name", "Selectivity"], ["type", "spin"], ["default", "2"]] }

      it "have `name` attribute" do
        expect(subject.name).to eq "Selectivity"
      end

      it "`type` is spin" do
        expect(subject.type).to eq "spin"
      end

      it "have `default` attribute(Fixnum)" do
        expect(subject.default).to be 2
      end
    end

    context 'type is others' do
      subject { USI::Resource::Option.new(args) }

      let(:args) { [["name", "Style"], ["type", "combo"], ["default", "Normal"]] }

      it "have `name` attribute" do
        expect(subject.name).to eq "Style"
      end

      it "`type` is combo" do
        expect(subject.type).to eq "combo"
      end

      it "have `default` attribute(String)" do
        expect(subject.default).to eq "Normal"
      end
    end

    context 'var is included' do
      subject { USI::Resource::Option.new(args) }

      let(:args) { [["name", "Style"], ["type", "combo"], ["var", "Solid"], ["var", "Normal"]] }

      it "have `name` attribute" do
        expect(subject.name).to eq "Style"
      end

      it "`type` is combo" do
        expect(subject.type).to eq "combo"
      end

      it "have `var` attribute" do
        expect(subject.var).to eq ["Solid", "Normal"]
      end
    end

    context 'max, min is included' do
      subject { USI::Resource::Option.new(args) }

      let(:args) { [["name", "Selectivity"], ["type", "spin"], ["default", "2"], ["min", "0"], ["max", "4"]] }

      it "have `name` attribute" do
        expect(subject.name).to eq "Selectivity"
      end

      it "`type` is combo" do
        expect(subject.type).to eq "spin"
      end

      it "have `max` attribute(Fixnum)" do
        expect(subject.max).to be 4
      end

      it "have `min` attribute(Fixnum)" do
        expect(subject.min).to be 0
      end
    end
  end
end
