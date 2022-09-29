# frozen_string_literal: true

ActiveAdmin.register Doctor do
  decorate_with DoctorDecorator

  permit_params :phone_number, :password, :password_confirmation, :name, :expirience, :description, :workplace, :workplace_address, :remember_created_at, :image, :category_id
  
  index do
    selectable_column
    id_column
    column :image do |doctor|
      image_tag(doctor.main_image, size: '30')
    end
    column :category
    column :phone_number
    column :name
    column :expirience
    column I18n.t('doctors.admin.short_description'), &:short_description
    column :workplace
    column :workplace_address
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :phone_number
      f.input :password, required: f.object.new_record?
      f.input :password_confirmation, required: f.object.new_record? if f.object.new_record?
      f.input :name
      f.input :expirience
      f.input :description
      f.input :workplace
      f.input :workplace_address
      f.inputs do
        f.input :image, as: :hidden, input_html: { value: f.object.cached_image_data }
        f.input :image, as: :file, hint: ((image_tag f.object.image_url, size: '50') if f.object.image)
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :category
      row :phone_number
      row :name
      row :expirience
      row :description
      row :workplace
      row :workplace_address
      row :created_at
      row :updated_at
      row :image do |doctor|
        image_tag(doctor.main_image, size: '150')
      end
    end
  end
end