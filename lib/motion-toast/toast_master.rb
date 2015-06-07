module MotionToast
  class ToastMaster

    include Conversions

    def initialize
    end

    def dismiss_all(animated=false)
      CRToastManager.dismissAllNotifications animated
    end

    # is toast currently showing?
    def showing?
      CRToastManager.manager.showingNotification
    end

    # show me the toast!
    def show(text="", opts={})
      defaults = {text: text}
      cr_options = convert defaults.merge(opts)
      cr_completion_block = lambda do 
      end
      CRToastManager.showNotificationWithOptions(cr_options, completionBlock:cr_completion_block)
    end

  end
end
