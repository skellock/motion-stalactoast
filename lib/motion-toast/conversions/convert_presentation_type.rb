module MotionToast::Conversions

  def convert_presentation_type(origin, destination)
    dk = KCRToastNotificationPresentationTypeKey
    value = origin[:presentation] || origin[:presentation_type]
    case value
    when :cover
      destination[dk] = CRToastPresentationTypeCover
    when :push
      destination[dk] = CRToastPresentationTypePush
    else
      destination[dk] = CRToastPresentationTypeCover
    end
  end

end
