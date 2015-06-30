module Stalactoast::Conversions

  def convert_under_status_bar(origin, destination)
    dk = KCRToastUnderStatusBarKey
    value = origin[:under_status_bar] == true || false
    destination[dk] = value
  end

end
