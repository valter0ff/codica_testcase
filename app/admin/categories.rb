# frozen_string_literal: true

ActiveAdmin.register Category do
  config.sort_order = 'id_asc'

  permit_params :title, :image

  index do
    selectable_column
    id_column
    column :image do |category|
      image_tag(category.image_url(:small), size: '30') if category.image
    end
    column :title
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :image, as: :file, hint: ((image_tag f.object.image_url, size: '50') if f.object.image)
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :created_at
      row :updated_at
      row :image do |category|
        image_tag(category.image_url(:small), size: '50') if category.image
      end
    end
  end
end
