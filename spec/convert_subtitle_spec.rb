describe "Convert Subtitle" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_subtitle({subtitle: 'hi'}, d)
    d[KCRToastSubtitleTextKey].should != nil
  end

  it "has nil as default" do
    @object.convert_subtitle({}, {}).should == nil
  end

  it "sets the value correctly" do
    @object.convert_subtitle({subtitle: "Steve Subtitle"}, {}).should == "Steve Subtitle"
  end

end
