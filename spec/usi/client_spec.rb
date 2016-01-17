describe USI::Client do
  describe '#engine' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it do
      expect(client.engine).to be_instance_of USI::Engine
    end
  end

  describe '#command' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command" do
      expect(client.engine).to receive(:command).with("command name").and_call_original
      expect(client.command("command name")).to be_instance_of USI::Response
    end
  end
end
