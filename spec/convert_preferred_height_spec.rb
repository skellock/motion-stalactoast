describe "Convert Preferred Height" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_preferred_height({}, d)
    d[KCRToastNotificationPreferredHeightKey].should != nil
  end

  it "sets a proper default" do
    @object.convert_preferred_height({}, {}).should == 0
  end

  it "sets the value correctly" do
    @object.convert_preferred_height({preferred_height: 100}, {}).should == 100
  end

end
