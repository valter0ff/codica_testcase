# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_all_categories

  devise_group :account, contains: %i[doctor user]

  unless Rails.env.development?
    rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_token
    rescue_from Exception, with: :internal_error
    rescue_from ActionController::RoutingError, with: :not_found
    rescue_from AbstractController::ActionNotFound, with: :not_found
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path, alert: exception.message
    end

  end

  private

  def set_all_categories
    @categories = Category.all
  end

  def invalid_token
    redirect_to '/422'
  end

  def not_found
    redirect_to '/404'
  end

  def internal_error
    redirect_to '/500'
  end

  def current_ability
    @current_ability ||= if doctor_signed_in?
                           DoctorAbility.new(current_doctor)
                         elsif user_signed_in?
                           UserAbility.new(current_user)
                         else
                           BaseAbility.new(User.new)
                         end
  end
end
