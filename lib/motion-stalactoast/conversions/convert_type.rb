module Stalactoast::Conversions

  def convert_type(origin, destination)
    dk = KCRToastNotificationTypeKey
    value = origin[:type] || origin[:notification_type]
    case value
    when :custom
      destination[dk] = CRToastTypeCustom
    when :navigation_bar, :navbar, :nav_bar, :nav
      destination[dk] = CRToastTypeNavigationBar
    when :status_bar, :statusbar, :status
      destination[dk] = CRToastTypeStatusBar
    else
      destination[dk] = CRToastTypeStatusBar
    end
  end

end
