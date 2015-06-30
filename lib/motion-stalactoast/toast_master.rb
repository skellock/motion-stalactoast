module Stalactoast
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
    def show(text=nil, opts={})
      defaults = {text: text}
      o = {}.merge(defaults)
      o = o.merge(text) if text.is_a?(Hash)
      o = o.merge(opts) if opts.is_a?(Hash)
      cr_options = convert o
      cr_completion_block = lambda do
        # TODO: callback?
      end
      cr_appearance_block = lambda do
        # TODO: callback?
      end
      CRToastManager.showNotificationWithOptions(cr_options, apperanceBlock: cr_appearance_block, completionBlock:cr_completion_block)
    end

  end
end
