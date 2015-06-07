describe "Convert Text" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_text({}, d)
    d[KCRToastTextKey].should != nil
  end

  it "has empty string as default" do
    @object.convert_text({}, {}).should == ""
  end

  it "sets the value correctly" do
    @object.convert_text({text: "Steve"}, {}).should == "Steve"
  end

end
