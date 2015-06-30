describe "toast" do

  before do
    @object = Object.new
    @object.extend Stalactoast
  end

  after do
    Stalactoast::ToastMaster.new.dismiss_all
  end

  it "should return a a ToastMaster" do
    @object.toast.class.should == Stalactoast::ToastMaster
  end

  it "should automatically call show" do
    @object.toast.showing?.should == true
  end

  it "should defer calling show if asked" do
    @object.toast("hi", show: false).showing?.should == false
  end

  it "clears out existing toasts if asked" do
    t = Stalactoast::ToastMaster.new
    t.showing?.should == false
    t.show "before"
    t.showing?.should == true
    n = @object.toast("override", dismiss: :all, show: false)
    n.showing?.should == false
  end

end
