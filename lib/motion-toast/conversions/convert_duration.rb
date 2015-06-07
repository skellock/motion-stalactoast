module MotionToast::Conversions

  def convert_duration(origin, destination)
    dk = KCRToastTimeIntervalKey
    value = origin[:duration] || origin[:time_interval]
    return unless value
    destination[dk] = value.to_f
  end

end
