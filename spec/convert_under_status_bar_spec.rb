describe "Convert Under Status Bar" do

  before do
    @object = Object.new
    @object.extend Stalactoast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_under_status_bar({}, d)
    d[KCRToastUnderStatusBarKey].should != nil
  end

  it "is false by default" do
    @object.convert_under_status_bar({}, {}).should == false
  end

  it "sets the value correctly" do
    @object.convert_under_status_bar({under_status_bar: true}, {}).should == true
  end

end
