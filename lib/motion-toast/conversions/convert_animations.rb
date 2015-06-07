module MotionToast::Conversions

  def convert_animations(origin, destination)
    origin[:in_animation] ||= {}
    convert_animation_type      origin[:in_animation][:type], KCRToastAnimationInTypeKey, destination
    convert_animation_direction origin[:in_animation][:direction], KCRToastAnimationInDirectionKey, destination
    convert_animation_time      origin[:in_animation][:time], KCRToastAnimationInTimeIntervalKey, destination

    origin[:out_animation] ||= {}
    convert_animation_type      origin[:out_animation][:type], KCRToastAnimationOutTypeKey, destination
    convert_animation_direction origin[:out_animation][:direction], KCRToastAnimationOutDirectionKey, destination
    convert_animation_time      origin[:out_animation][:time], KCRToastAnimationOutTimeIntervalKey, destination

    convert_spring_damping origin, destination
    convert_spring_initial_velocity origin, destination
    convert_gravity origin, destination

    destination
  end

  def convert_animation_type(value, destination_key, destination)
    value = :linear unless [:linear, :spring, :gravity].include?(value)
    destination[destination_key] = case value
      when :linear  then CRToastAnimationTypeLinear
      when :spring  then CRToastAnimationTypeSpring
      when :gravity then CRToastAnimationTypeGravity
    end
  end

  def convert_animation_direction(value, destination_key, destination)
    value = :top unless [:top, :bottom, :left, :right].include?(value)
    destination[destination_key] = case value
      when :top    then CRToastAnimationDirectionTop
      when :bottom then CRToastAnimationDirectionBottom
      when :left   then CRToastAnimationDirectionLeft
      when :right  then CRToastAnimationDirectionRight
    end
  end

  def convert_animation_time(value, destination_key, destination)
    return if value.nil?
    value = -1 unless value.respond_to?(:to_f)
    value = value.to_f
    value = 0.3 if value < 0
    destination[destination_key] = value
  end

  def convert_spring_damping(origin, destination)
    dk = KCRToastAnimationSpringDampingKey
    value = origin[:spring_damping]
    value = -1 if value.nil?
    value = -1 unless value.respond_to?(:to_f)
    value = value.to_f
    value = 0.6 if value < 0
    destination[dk] = value
  end

  def convert_spring_initial_velocity(origin, destination)
    dk = KCRToastAnimationSpringInitialVelocityKey
    value = origin[:spring_initial_velocity]
    value = -1 if value.nil?
    value = -1 unless value.respond_to?(:to_f)
    value = value.to_f
    value = 1.0 if value < 0
    destination[dk] = value
  end

  def convert_gravity(origin, destination)
    dk = KCRToastAnimationGravityMagnitudeKey
    value = origin[:gravity] || origin[:gravity_magnitude]
    value = -1 if value.nil?
    value = -1 unless value.respond_to?(:to_f)
    value = value.to_f
    value = 1.0 if value < 0
    destination[dk] = value
  end

end
