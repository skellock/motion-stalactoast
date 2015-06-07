module MotionToast::Conversions

  def convert_background_view(origin, destination)
    dk = KCRToastBackgroundViewKey
    value = origin[:background_view] || origin[:bg_view]
    return unless value
    destination[dk] = value
  end

end
