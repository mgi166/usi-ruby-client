describe USI::Session do
  describe '#write' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Session.new(engine) }

    it "STDIN is closed after #write" do
      session.write("hoge")
      expect(session.stdin).to be_closed
    end
  end

  describe '#read' do
    let(:engine) { USI::Engine.new("spec/bin/dummy_engine") }
    let(:session) { USI::Session.new(engine) }

    it do
      session.write('hoge')
      expect(session.read).to be_instance_of USI::Response
    end
  end
end
