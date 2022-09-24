class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title, index: { unique: true }
      t.text :image_data

      t.timestamps
    end
  end
end
