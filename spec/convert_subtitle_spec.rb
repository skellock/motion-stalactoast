describe "Convert Subtitle" do

  before do
    @object = Object.new
    @object.extend MotionToast::Conversions
  end

  it "sets the right default" do
    d = {}
    @object.convert_subtitle({}, d)
    d[KCRToastSubtitleTextKey].should == nil
  end

  it "sets the right value when it is a string" do
    d = {}
    @object.convert_subtitle({subtitle: "Liam"}, d)
    d[KCRToastSubtitleTextKey].should == "Liam"
  end

  describe "Good Params" do
    before do
      @in = {
        value: "Matthew",
        font: UIFont.systemFontOfSize(69),
        color: UIColor.blueColor,
        alignment: :right,
        shadow_color: UIColor.blackColor,
        shadow_offset: 5,
        max_lines: 10
      }
      @out = {}
      @object.convert_subtitle({subtitle: @in}, @out)
    end

    it "sets the right value" do
      @out[KCRToastSubtitleTextKey].should == "Matthew"
    end

    it "sets the right font" do
      @out[KCRToastSubtitleFontKey].should == @in[:font]
    end

    it "sets the right color" do
      @out[KCRToastSubtitleTextColorKey].should == @in[:color]
    end

    it "sets the right alignment" do
      @out[KCRToastSubtitleTextAlignmentKey].should == NSTextAlignmentRight
    end

    it "sets the right shadow color" do
      @out[KCRToastSubtitleTextShadowColorKey].should == @in[:shadow_color]
    end

    it "sets the right shadow offset" do
      @out[KCRToastSubtitleTextShadowOffsetKey].width.should == @in[:shadow_offset].to_f
      @out[KCRToastSubtitleTextShadowOffsetKey].height.should == @in[:shadow_offset].to_f
    end

    it "sets the right max lines" do
      @out[KCRToastSubtitleTextMaxNumberOfLinesKey].should == @in[:max_lines]
    end

  end

end
