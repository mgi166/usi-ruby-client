describe USI::Client do
  describe '#engine' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it do
      expect(client.engine).to be_instance_of USI::Engine
    end
  end
end
