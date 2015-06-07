module MotionToast::Conversions

  def convert_text(origin, destination)
    dk = KCRToastTextKey
    value = origin[:text] || ""
    destination[dk] = value
  end

end
