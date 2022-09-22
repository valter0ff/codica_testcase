# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

['Allergy and immunology', 'Dermatology', 'Family medicine', 'Neurology', 'Gynecology', 'Ophthalmology', 'Pediatrics', 'Psychiatry', 'Surgery', 'Urology'].each do |spec|
  Category.create(title: spec)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?