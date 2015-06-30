describe "Convert Text" do

  before do
    @object = Object.new
    @object.extend Stalactoast::Conversions
  end

  it "sets the right default" do
    d = {}
    @object.convert_text({}, d)
    d[KCRToastTextKey].should == ""
  end

  it "sets the right value when it is a string" do
    d = {}
    @object.convert_text({text: "Liam"}, d)
    d[KCRToastTextKey].should == "Liam"
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
      @object.convert_text({text: @in}, @out)
    end

    it "sets the right value" do
      @out[KCRToastTextKey].should == "Matthew"
    end

    it "sets the right font" do
      @out[KCRToastFontKey].should == @in[:font]
    end

    it "sets the right color" do
      @out[KCRToastTextColorKey].should == @in[:color]
    end

    it "sets the right alignment" do
      @out[KCRToastTextAlignmentKey].should == NSTextAlignmentRight
    end

    it "sets the right shadow color" do
      @out[KCRToastTextShadowColorKey].should == @in[:shadow_color]
    end

    it "sets the right shadow offset" do
      @out[KCRToastTextShadowOffsetKey].width.should == @in[:shadow_offset].to_f
      @out[KCRToastTextShadowOffsetKey].height.should == @in[:shadow_offset].to_f
    end

    it "sets the right max lines" do
      @out[KCRToastTextMaxNumberOfLinesKey].should == @in[:max_lines]
    end

  end
end
