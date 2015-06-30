module Stalactoast::Conversions

  def convert_image(origin, destination)
    options = {}
    options.merge! origin[:image] if origin[:image].is_a?(Hash)
    options[:value] = origin[:image] if origin[:image].is_a?(UIImage)

    return if options[:value].nil? # hard stop for no images

    convert_image_value     options[:value], KCRToastImageKey, destination
    convert_image_alignment options[:alignment], KCRToastImageAlignmentKey, destination
    convert_image_content_mode options[:content_mode], KCRToastImageContentModeKey, destination
  end

  def convert_image_value(value, key, destination)
    destination[key] = value
  end

  def convert_image_alignment(value, key, destination)
    destination[key] = case value
      when :left then NSTextAlignmentLeft
      when :center, :centre, :centered, :centered then NSTextAlignmentCenter
      when :right then NSTextAlignmentRight
      else
        NSTextAlignmentLeft
      end
  end

  def convert_image_content_mode(value, key, destination)
    destination[key] = case value
      when :scale_to_fill     then UIViewContentModeScaleToFill
      when :scale_aspect_fit  then UIViewContentModeScaleAspectFit
      when :scale_aspect_fill then UIViewContentModeScaleAspectFill
      when :redraw            then UIViewContentModeRedraw
      when :center, :centre   then UIViewContentModeCenter
      when :top               then UIViewContentModeTop
      when :bottom            then UIViewContentModeBottom
      when :left              then UIViewContentModeLeft
      when :right             then UIViewContentModeRight
      when :top_left          then UIViewContentModeTopLeft
      when :top_right         then UIViewContentModeTopRight
      when :bottom_left       then UIViewContentModeBottomLeft
      when :bottom_right      then UIViewContentModeBottomRight
      else
        UIViewContentModeCenter
      end
  end


end
