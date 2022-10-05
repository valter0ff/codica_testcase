# frozen_string_literal: true

module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:phone_number, :name, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:phone_number, :password, :remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end