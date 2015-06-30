describe "Convert Type" do

  before do
    @object = Object.new
    @object.extend Stalactoast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_type({}, d)
    d[KCRToastNotificationTypeKey].should != nil
  end

  it "has :status_bar as default" do
    @object.convert_type({}, {}).should == CRToastTypeStatusBar
  end

  it "knows :custom" do
    @object.convert_type({type: :custom}, {}).should == CRToastTypeCustom
  end

  it "knows :navigation_bar" do
    @object.convert_type({type: :navigation_bar}, {}).should == CRToastTypeNavigationBar
    @object.convert_type({type: :navbar}, {}).should == CRToastTypeNavigationBar
    @object.convert_type({type: :nav_bar}, {}).should == CRToastTypeNavigationBar
    @object.convert_type({type: :nav}, {}).should == CRToastTypeNavigationBar
  end

  it "knows :status_bar" do
    @object.convert_type({type: :status_bar}, {}).should == CRToastTypeStatusBar
    @object.convert_type({type: :statusbar}, {}).should == CRToastTypeStatusBar
    @object.convert_type({type: :status}, {}).should == CRToastTypeStatusBar
  end

  it "can also be set via :notification_type" do
    @object.convert_type({notification_type: :status_bar}, {}).should == CRToastTypeStatusBar
  end

end
