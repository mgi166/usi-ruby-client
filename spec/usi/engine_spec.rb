describe USI::Engine do
  describe "#engine_path" do
    let(:engine) { USI::Engine.new("path/to/engine") }

    it "returns pathname of engine" do
      expect(engine.engine_path).to be_instance_of Pathname
      expect(engine.engine_path.to_s).to match /path\/to\/engine\z/
    end
  end

  describe "#validate!" do
    context 'the engine does not exist' do
      it do
        expect do
          USI::Engine.new("path/to/engine").validate!
        end.to raise_error USI::Engine::NoSuchEngineError
      end
    end
  end

  describe "#command" do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }

    it do
      expect(engine.command("command")).to be_instance_of USI::Response
    end
  end
end
