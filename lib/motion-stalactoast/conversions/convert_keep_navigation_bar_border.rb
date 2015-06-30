module Stalactoast::Conversions

  def convert_keep_navigation_bar_border(origin, destination)
    dk = KCRToastKeepNavigationBarBorderKey
    value = origin[:keep_navigation_bar_border] == true || false
    destination[dk] = value
  end

end
