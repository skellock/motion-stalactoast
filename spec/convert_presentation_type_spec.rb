describe "Convert Presentation Type" do

  before do
    @object = Object.new
    @object.extend Stalactoast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_presentation_type({}, d)
    d[KCRToastNotificationPresentationTypeKey].should != nil
  end

  it "has :cover as default" do
    @object.convert_presentation_type({}, {}).should == CRToastPresentationTypeCover
  end

  it "knows :cover" do
    @object.convert_presentation_type({presentation: :cover}, {}).should == CRToastPresentationTypeCover
  end

  it "knows :push" do
    @object.convert_presentation_type({presentation: :push}, {}).should == CRToastPresentationTypePush
  end

  it "can also be set via :presentation_type" do
    @object.convert_presentation_type({presentation_type: :cover}, {}).should == CRToastPresentationTypeCover
  end

end
