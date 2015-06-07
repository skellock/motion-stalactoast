describe "toast" do

  before do
    @object = Object.new
    @object.extend MotionToast
  end

  it "shouldn't require parameters" do
    @object.toast.class.should == MotionToast::ToastMaster
  end

end
