describe "Convert Background View" do

  before do
    @object = Object.new
    @object.extend Stalactoast::Conversions
    @v = UIView.alloc.init
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_background_view({background_view: @v}, d)
    d[KCRToastBackgroundViewKey].should != nil
  end

  it "sets the value correctly" do
    @object.convert_background_view({background_view: @v}, {}).should == @v
  end

  it "allows :bg_view as well" do
    @object.convert_background_view({bg_view: @v}, {}).should == @v
  end

end
