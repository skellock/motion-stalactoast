describe "Convert Background Color" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_background_color({}, d)
    d[KCRToastBackgroundColorKey].should != nil
  end

  it "has red as default" do
    @object.convert_background_color({}, {}).should == UIColor.redColor
  end

  it "sets the value correctly" do
    c = UIColor.blueColor
    @object.convert_background_color({background_color: c}, {}).should == c
  end

  it "supports bg_color as well" do
    c = UIColor.blueColor
    @object.convert_background_color({bg_color: c}, {}).should == c
  end

end
