describe USI::Client do
  describe '#engine' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it do
      expect(client.engine).to be_instance_of USI::Engine
    end
  end

  describe '#usi' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `usi`" do
      expect(client).to receive(:command).with("usi")
      client.usi
    end
  end

  describe '#isready' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `isready`" do
      expect(client).to receive(:command).with("isready")
      client.isready
    end
  end

  describe '#usinewgame' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `usinewgame`" do
      expect(client).to receive(:command).with("usinewgame")
      client.usinewgame
    end
  end

  describe '#stop' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `stop`" do
      expect(client).to receive(:command).with("stop")
      client.stop
    end
  end

  describe '#ponderhit' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `ponderhit`" do
      expect(client).to receive(:command).with("ponderhit")
      client.ponderhit
    end
  end

  describe '#quit' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }


    it "call USI::Engine#command with `quit`" do
      expect(client).to receive(:command).with("quit")
      client.quit
    end
  end

  describe '#command' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command" do
      expect(client.engine).to receive(:command).with("command name").and_call_original
      expect(client.send(:command, "command name")).to be_instance_of USI::Response
    end
  end
end
