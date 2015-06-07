describe "toast" do

  extend MotionToast

  it "shouldn't require parameters" do
    toast.class.should == MotionToast::ToastMaster
  end

end
