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

  describe '#setoption' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `setoption`" do
      expect(client).to receive(:command).with("setoption name key1 value value1")

      client.setoption("key1", "value1")
    end

    context 'invalid parameter' do
      context 'name is blank' do
        it do
          expect { client.setoption("", "value1") }
            .to raise_error USI::Client::MissingCommandParameter
        end
      end

      context 'value is blank' do
        it do
          expect { client.setoption("name1", "") }
            .to raise_error USI::Client::MissingCommandParameter
        end
      end
    end
  end

  describe '#gameover' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `gameover`" do
      expect(client).to receive(:command).with("gameover win")
      client.gameover("win")
    end

    context 'invalid parameter' do
      it do
        expect { client.gameover("hoge") }
          .to raise_error USI::Client::MissingCommandParameter
      end
    end
  end

  describe '#go_ponder' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `go ponder`" do
      expect(client).to receive(:command).with("go ponder")
      client.go_ponder
    end
  end

  describe '#go_infinite' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    it "call USI::Engine#command with `go infinite`" do
      expect(client).to receive(:command).with("go infinite")
      client.go_infinite
    end
  end

  describe '#go_mate' do
    let(:client) { USI::Client.new("spec/bin/dummy_engine") }

    context 'time is present' do
      it "call USI::Engine#command with `go mate {time}`" do
        expect(client).to receive(:command).with("go mate 1000")
        client.go_mate(1000)
      end
    end

    context 'time is blank' do
      it "call USI::Engine#command with `go mate infinite`" do
        expect(client).to receive(:command).with("go mate infinite")
        client.go_mate(nil)
      end
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
