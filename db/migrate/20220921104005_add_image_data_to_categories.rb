class AddImageDataToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :image_data, :text
  end
end
