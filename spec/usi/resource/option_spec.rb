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
end
