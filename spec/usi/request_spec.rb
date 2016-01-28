describe USI::Request do
  describe '#perform' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Request.new(engine) }

    it do
      expect(session.perform('hoge')).to be_instance_of USI::Response
    end
  end

  describe '#pid' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Request.new(engine) }

    it do
      expect(session.pid).to be_instance_of Fixnum
    end

    it "delegates on Process::Waiter#pid" do
      expect(session.wait_thr).to receive(:pid).with(no_args)
      session.pid
    end
  end

  describe '#status' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Request.new(engine) }

    it "delegates on Process::Waiter#status" do
      expect(session.wait_thr).to receive(:status).with(no_args)
      session.status
    end
  end

  describe '#alive?' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Request.new(engine) }

    it "delegates on Process::Waiter#alive?" do
      expect(session.wait_thr).to receive(:alive?).with(no_args)
      session.alive?
    end
  end

  describe '#stop?' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Request.new(engine) }

    it "delegates on Process::Waiter#stop?" do
      expect(session.wait_thr).to receive(:stop?).with(no_args)
      session.stop?
    end
  end

  describe '#kill' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Request.new(engine) }

    it "delegates on Process::Waiter#kill" do
      expect(session.wait_thr).to receive(:kill).with(no_args)
      session.kill
    end
  end
end
