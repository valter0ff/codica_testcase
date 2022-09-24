# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homepage#index'
  %w[404 422 500].each do |code|
    match "/#{code}", to: 'errors#show', code: code, via: :all
  end
end
