module MotionToast::Conversions

  def convert_subtitle(origin, destination)
    value = origin[:subtitle]
    return if value.nil?
    dk = KCRToastSubtitleTextKey
    destination[dk] = value
  end

end
