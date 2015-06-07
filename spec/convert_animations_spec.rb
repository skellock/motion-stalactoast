describe "Convert Animations" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
    @d = {}
    @good = {
      in_animation: { type: :spring, direction: :left, time: 0.11 },
      out_animation: { type: :gravity, direction: :right, time: 0.12 },
    }
  end

  it "sets the appropriate CRToast keys" do
    d = {}
    @object.convert_animations(@good, d)
    d[KCRToastAnimationInTypeKey].should != nil
    d[KCRToastAnimationInDirectionKey].should != nil
    d[KCRToastAnimationInTimeIntervalKey].should != nil
    d[KCRToastAnimationOutTypeKey].should != nil
    d[KCRToastAnimationOutDirectionKey].should != nil
    d[KCRToastAnimationOutTimeIntervalKey].should != nil
    d[KCRToastAnimationSpringDampingKey].should != nil
    d[KCRToastAnimationSpringInitialVelocityKey].should != nil
    d[KCRToastAnimationGravityMagnitudeKey].should != nil
  end

  it "has a default for type" do
    @object.convert_animations({}, @d)
    @d[KCRToastAnimationInTypeKey].should == CRToastAnimationTypeLinear
    @d[KCRToastAnimationOutTypeKey].should == CRToastAnimationTypeLinear
  end

  it "has a default for direction" do
    @object.convert_animations({}, @d)
    @d[KCRToastAnimationInDirectionKey].should == CRToastAnimationDirectionTop
    @d[KCRToastAnimationOutDirectionKey].should == CRToastAnimationDirectionTop
  end

  it "has no default for time" do
    @object.convert_animations({}, @d)
    @d[KCRToastAnimationInTimeIntervalKey].should == nil
    @d[KCRToastAnimationOutTimeIntervalKey].should == nil
  end

  it "has a default for physics properties" do
    @object.convert_animations({}, @d)
    @d[KCRToastAnimationSpringDampingKey].should == 0.6
    @d[KCRToastAnimationSpringInitialVelocityKey].should == 1.0
    @d[KCRToastAnimationGravityMagnitudeKey].should == 1.0
  end

  it "sets the type correctly" do
    @object.convert_animations(@good, @d)
    @d[KCRToastAnimationInTypeKey].should == CRToastAnimationTypeSpring
    @d[KCRToastAnimationOutTypeKey].should == CRToastAnimationTypeGravity
  end

  it "sets the direction correctly" do
    @object.convert_animations(@good, @d)
    @d[KCRToastAnimationInDirectionKey].should == CRToastAnimationDirectionLeft
    @d[KCRToastAnimationOutDirectionKey].should == CRToastAnimationDirectionRight
  end

  it "sets the time correctly" do
    @object.convert_animations(@good, @d)
    @d[KCRToastAnimationInTimeIntervalKey].should == 0.11
    @d[KCRToastAnimationOutTimeIntervalKey].should == 0.12
  end

  it "sets the spring damping properly" do
    @object.convert_spring_damping({spring_damping: 5.0}, {}).should == 5.0
  end

  it "sets the spring initial velocity properly" do
    @object.convert_spring_initial_velocity({spring_initial_velocity: 5.0}, {}).should == 5.0
  end

  it "sets the gravity properly" do
    @object.convert_gravity({gravity: 2.0}, {}).should == 2.0
    @object.convert_gravity({gravity_magnitude: 2.0}, {}).should == 2.0
  end


end
