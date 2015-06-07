describe "ToastMaster" do

  before do
    @tm = MotionToast::ToastMaster.new
  end

  after do
    @tm.dismiss_all
  end

  it "knows when it is hasn't been shown" do
    @tm.showing?.should == false
  end

  it "knows when it is showing" do
    @tm.show
    @tm.showing?.should == true
  end

  it "knows can dismiss all notifications" do
    @tm.showing?.should == false
    @tm.show
    @tm.showing?.should == true
    @tm.dismiss_all
    @tm.showing?.should == false
  end

end
