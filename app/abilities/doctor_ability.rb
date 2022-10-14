# frozen_string_literal: true

class DoctorAbility < BaseAbility
  def initialize(user)
    super(user)

    can [:read, :update], Doctor, id: user.id
    can :read, User, appointment: { doctor: user }
    can :read, Appointment, doctor: user
    can :update, Appointment, doctor: user, status: :active
  end
end
