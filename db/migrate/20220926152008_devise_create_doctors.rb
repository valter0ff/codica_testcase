# frozen_string_literal: true

class DeviseCreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :phone_number, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :experience, null: false, default: 0
      t.string :description, null: false, default: ""
      t.string :workplace, null: false, default: ""
      t.datetime :remember_created_at
      t.text :image_data
      t.references :category, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :doctors, :phone_number, unique: true
  end
end
