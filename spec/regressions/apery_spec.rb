describe "Apery" do
  let(:repository_root) { Pathname.new(__dir__).join("../..") }
  let(:apery_path) { repository_root.join("../apery/bin/apery") }

  it do
    # do something
    client = USI::Client.new(apery_path)
  end
end
