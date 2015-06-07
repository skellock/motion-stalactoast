module MotionToast

  # make a ToastMaster
  def toast(text="", options={})
    ToastMaster.new.tap do |tm|
      tm.dismiss_all if options[:dismiss] == :all
      tm.show text, options unless options[:show] == false
    end
  end

end
