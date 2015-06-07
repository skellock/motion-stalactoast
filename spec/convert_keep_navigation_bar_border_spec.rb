describe "Convert Keep Navigation Bar Border" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_keep_navigation_bar_border({}, d)
    d[KCRToastKeepNavigationBarBorderKey].should != nil
  end

  it "is true by default" do
    @object.convert_keep_navigation_bar_border({}, {}).should == false
  end

  it "sets the value correctly" do
    @object.convert_keep_navigation_bar_border({keep_navigation_bar_border: false}, {}).should == false
  end

end
