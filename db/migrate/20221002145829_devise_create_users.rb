# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :phone_number, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name, null: false, default: ""
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :phone_number, unique: true
    add_index :users, :name, unique: true
  end
end
