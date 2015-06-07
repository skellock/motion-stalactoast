module MotionToast::Conversions

  MOTION_TOAST_DEFAULT_FONT = UIFont.systemFontOfSize(12)
  MOTION_TOAST_DEFAULT_COLOR = UIColor.whiteColor

  def convert_text(origin, destination)
    options = {}
    options.merge! origin[:text] if origin[:text].is_a?(Hash)
    options[:value] = origin[:text] if origin[:text].is_a?(String)

    convert_label_value         options[:value] || "", KCRToastTextKey, destination
    convert_label_font          options[:font], KCRToastFontKey, destination
    convert_label_color         options[:color], KCRToastTextColorKey, destination
    convert_label_alignment     options[:alignment], KCRToastTextAlignmentKey, destination
    convert_label_shadow_color  options[:shadow_color], KCRToastTextShadowColorKey, destination
    convert_label_shadow_offset options[:shadow_offset], KCRToastTextShadowOffsetKey, destination
    convert_label_max_lines     options[:max_lines], KCRToastTextMaxNumberOfLinesKey, destination
  end

  def convert_subtitle(origin, destination)
    options = {}
    options.merge! origin[:subtitle] if origin[:subtitle].is_a?(Hash)
    options[:value] = origin[:subtitle] if origin[:subtitle].is_a?(String)

    return unless options[:value]
    convert_label_value         options[:value], KCRToastSubtitleTextKey, destination
    convert_label_font          options[:font], KCRToastSubtitleFontKey, destination
    convert_label_color         options[:color], KCRToastSubtitleTextColorKey, destination
    convert_label_alignment     options[:alignment], KCRToastSubtitleTextAlignmentKey, destination
    convert_label_shadow_color  options[:shadow_color], KCRToastSubtitleTextShadowColorKey, destination
    convert_label_shadow_offset options[:shadow_offset], KCRToastSubtitleTextShadowOffsetKey, destination
    convert_label_max_lines     options[:max_lines], KCRToastSubtitleTextMaxNumberOfLinesKey, destination
  end

  def convert_label_value(value, key, destination)
    destination[key] = value
  end

  def convert_label_font(value, key, destination)
    destination[key] = value.is_a?(UIFont) ? value : MOTION_TOAST_DEFAULT_FONT
  end

  def convert_label_color(value, key, destination)
    destination[key] = value.is_a?(UIColor) ? value : MOTION_TOAST_DEFAULT_COLOR
  end

  def convert_label_alignment(value, key, destination)
    destination[key] = case value
      when :left then NSTextAlignmentLeft
      when :center, :centre, :centered, :centered then NSTextAlignmentCenter
      when :right then NSTextAlignmentRight
      else
        NSTextAlignmentCenter
      end
  end

  def convert_label_shadow_color(value, key, destination)
    destination[key] = value.is_a?(UIColor) ? value : MOTION_TOAST_DEFAULT_COLOR
  end

  def convert_label_shadow_offset(value, key, destination)
    v = value || 0
    v = CGSizeMake(v.to_f, v.to_f) if v.is_a?(Fixnum) || v.is_a?(Float)
    v = CGSizeMake(v[0].to_f, v[1].to_f) if v.is_a?(Array) && v.length == 2
    v = CGSizeMake(0, 0) unless v.is_a?(CGSize)
    # TODO: I think this is a bug in CRToast
    v = NSValue.valueWithCGSize(v)
    destination[key] = v
  end

  def convert_label_max_lines(value, key, destination)
    v = value
    v = 0 if v == :unlimited
    v = 0 unless v.respond_to?(:to_i)
    v = v.to_i
    destination[key] = v
  end

end
