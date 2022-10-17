# frozen_string_literal: true

class UserAbility < BaseAbility
  def initialize(user)
    super(user)

    can %i[read create update], User, id: user.id
    can %i[read create], Appointment, user: user
  end
end
