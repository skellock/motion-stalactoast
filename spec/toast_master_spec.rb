describe "ToastMaster" do

  before do
    @tm = MotionToast::ToastMaster.new
  end

  it "knows when it is hasn't been shown" do
    @tm.showing?.should == false
  end

  it "knows when it is showing" do
    @tm.show
    @tm.showing?.should == true
  end

end
