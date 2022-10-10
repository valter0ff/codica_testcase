# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homepage#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  authenticate :user do
    namespace :users do
      resources :appointments, only: %i[index show create]
      resource :profile, only: %i[show]
    end
  end
  devise_for :doctors, skip: [:registrations]
  devise_scope :doctor do
    get 'doctors/edit' => 'doctors/registrations#edit', :as => 'edit_doctor_registration'
    patch 'doctors' => 'doctors/registrations#update', :as => 'doctor_registration'
  end
  authenticate :doctor do
    namespace :doctors do
      resources :appointments, only: %i[index show edit update]
      resource :profile, only: %i[show]
    end
  end
  %w[404 422 500].each do |code|
    match "/#{code}", to: 'errors#show', code:, via: :all
  end
  resources :doctors, only: %i[index]
end
