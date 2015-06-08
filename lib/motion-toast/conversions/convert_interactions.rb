module MotionToast::Conversions

  def convert_interactions(origin, destination)
    dk = KCRToastInteractionRespondersKey
    responders = []
    if origin[:dismiss_interaction] != :none
      responders << CRToastInteractionResponder.interactionResponderWithInteractionType(CRToastInteractionTypeAll, automaticallyDismiss: true, block: nil)
    end

    destination[dk] = responders
  end

end
