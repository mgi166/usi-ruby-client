describe USI::Engine do
  describe "#engine_path" do
    let(:engine) { USI::Engine.new("path/to/engine") }

    it "returns pathname of engine" do
      expect(engine.engine_path).to eq Pathname.new("path/to/engine")
    end
  end
end
