describe "Convert Image" do

  before do
    @object = Object.new
    @object.extend Stalactoast::Conversions
    @image = UIImage.imageNamed("motion-toast-card")
  end

  it "sets the right default" do
    d = {}
    @object.convert_image({}, d)
    d[KCRToastImageKey].should == nil
  end

  it "sets the right value when it is an image" do
    d = {}
    @object.convert_image({image: @image}, d)
    d[KCRToastImageKey].should == @image
  end

  describe "Good Params" do
    before do
      @in = {
        value: @image,
        alignment: :right,
        content_mode: :top,
      }
      @out = {}
      @object.convert_image({image: @in}, @out)
    end

    it "sets the right value" do
      @out[KCRToastImageKey].should == @in[:value]
    end

    it "sets the right alignment" do
      @out[KCRToastImageAlignmentKey].should == NSTextAlignmentRight
    end

    it "sets the right content mode" do
      @out[KCRToastImageContentModeKey].should == UIViewContentModeTop
    end

  end
end
