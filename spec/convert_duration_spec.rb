describe "Convert Preferred Height" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_duration({duration: 0}, d)
    d[KCRToastTimeIntervalKey].should != nil
  end

  it "sets the value correctly" do
    @object.convert_duration({duration: 5}, {}).should == 5.0
  end

end
