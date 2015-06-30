module Stalactoast::Conversions

  def convert_preferred_height(origin, destination)
    dk = KCRToastNotificationPreferredHeightKey
    value = origin[:preferred_height] || 0
    destination[dk] = value
  end

end
