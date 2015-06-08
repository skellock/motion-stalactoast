describe "Convert Interactions" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the appropriate CRToast key" do
    d = {}
    @object.convert_interactions({dismiss_interaction: :all}, d)
    d[KCRToastInteractionRespondersKey].should != nil
  end

  it "has responders for default" do
    @object.convert_interactions({}, {}).is_a?(Array).should == true
  end

end
