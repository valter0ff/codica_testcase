# frozen_string_literal: true

Rails.application.routes.draw do
  authenticated :doctor do
    root to: 'doctors/appointments#index', as: :authenticated_doctor_root
  end
  root to: 'homepage#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_for :doctors, skip: [:registrations]
  devise_scope :doctor do
    get 'doctors/edit' => 'devise/registrations#edit', :as => 'edit_doctor_registration'
    patch 'doctors' => 'devise/registrations#update', :as => 'doctor_registration'
  end
  namespace :doctors do
    resources :appointments, only: %i[index show]
    resource :profile, only: %i[show edit update]
  end
  %w[404 422 500].each do |code|
    match "/#{code}", to: 'errors#show', code:, via: :all
  end
  resources :doctors, only: %i[index]
end
