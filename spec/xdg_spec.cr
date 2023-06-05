require "./spec_helper"

describe XdgUserDir do
  it "can query using string" do
    dir = XdgUserDir.lookup("MUSIC")
    dir.should eq(Path.home.join("Music"))
  end

  it "can query using enums" do
    dir = XdgUserDir.lookup(:documents)
    dir.should eq(Path.home.join("Documents"))
  end
end
