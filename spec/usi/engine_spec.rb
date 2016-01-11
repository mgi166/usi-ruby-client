describe USI::Engine do
  describe "#engine_path" do
    let(:engine) { USI::Engine.new("path/to/engine") }

    it "returns pathname of engine" do
      expect(engine.engine_path).to eq Pathname.new("path/to/engine")
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
end
