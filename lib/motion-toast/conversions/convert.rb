module MotionToast::Conversions

  # convert all our dsl options to what CRToast expects
  def convert(origin={})
    destination = {}

    convert_text origin, destination
    convert_type origin, destination

    destination
  end

end