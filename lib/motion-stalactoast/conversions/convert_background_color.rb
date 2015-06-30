module Stalactoast::Conversions

  def convert_background_color(origin, destination)
    dk = KCRToastBackgroundColorKey
    value = origin[:background_color] || origin[:bg_color] || UIColor.redColor
    destination[dk] = value
  end

end
