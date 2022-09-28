# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homepage#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :doctors, skip: [:registrations]
  devise_scope :doctor do
    get 'doctors/edit' => 'devise/registrations#edit', :as => 'edit_doctor_registration'    
    patch 'doctors' => 'devise/registrations#update', :as => 'doctor_registration'            
  end
  authenticated :doctor do
    root to: 'doctorprofiles#show', as: :authenticated_doctor_root
  end
  %w[404 422 500].each do |code|
    match "/#{code}", to: 'errors#show', code: code, via: :all
  end
  resources :doctors, only: %i[index show]
  
end
