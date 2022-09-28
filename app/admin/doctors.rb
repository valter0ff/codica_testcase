# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :phone_number, :password, :password_confirmation, :name, :experience, :description, :workplace, :remember_created_at, :image, :category_id
  
  form do |f|
    f.inputs do
      f.input :category
      f.input :phone_number
      f.input :password, required: f.object.new_record?
      f.input :password_confirmation, required: f.object.new_record? if f.object.new_record?
      f.input :name
      f.input :experience
      f.input :description
      f.input :workplace
      f.input :image, as: :file, hint: ((image_tag f.object.image_url, size: '50') if f.object.image)
    end
    f.actions
  end
end