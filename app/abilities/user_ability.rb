# frozen_string_literal: true

class UserAbility <  BaseAbility
  def initialize(user)
    super(user)

    can [:read, :create, :update], User, id: user.id
    can [:read, :create], Appointment, user: user
  end
end
