# frozen_string_literal: true

class BaseAbility
  include CanCan::Ability

  def initialize(_user)
    can :read, Category
    can :read, Doctor, %i[name image expirience description workplace workplace_address]
  end
end
