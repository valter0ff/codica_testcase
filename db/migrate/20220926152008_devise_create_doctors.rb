# frozen_string_literal: true

class DeviseCreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :phone_number, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :expirience, null: false, default: 0
      t.string :description
      t.string :workplace
      t.string :workplace_address
      t.datetime :remember_created_at
      t.text :image_data
      t.references :category, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :doctors, :phone_number, unique: true
    add_index :doctors, :name, unique: true
  end
end
