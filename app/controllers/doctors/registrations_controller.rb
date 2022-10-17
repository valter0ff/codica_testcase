# frozen_string_literal: true

module Doctors
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def update_resource(resource, params)
      if params[:password].present? || params[:current_password].present?
        resource.update_with_password(params)
      else
        params.delete(:current_password)
        resource.update_without_password(params)
      end
    end

    def configure_permitted_parameters
      keys = %i[phone_number name password current_password image expirience description workplace workplace_address]
      devise_parameter_sanitizer.permit(:account_update, keys: keys)
    end

    def after_update_path_for(resource)
      doctors_profile_path
    end
  end
end
