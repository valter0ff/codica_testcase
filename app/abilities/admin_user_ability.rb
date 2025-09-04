# frozen_string_literal: true

class AdminUserAbility < BaseAbility
  def initialize(_user)
    can :manage, :all
  end
end
