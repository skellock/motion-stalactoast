module MotionToast::Conversions

  # convert all our dsl options to what CRToast expects
  def convert(origin={})
    destination = {}

    convert_text origin, destination
    convert_subtitle origin, destination
    convert_type origin, destination
    convert_preferred_height origin, destination
    convert_presentation_type origin, destination
    convert_under_status_bar origin, destination
    convert_keep_navigation_bar_border origin, destination
    convert_animations origin, destination

    destination
  end

end
