# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

['Allergy and immunology', 'Dermatology', 'Otolaryngology', 'Neurology', 'Gastroenterology', 'Gynecology', 'Ophthalmology', 'Pediatrics', 'Surgery', 'Urology', 'Cardiology'].each do |cat|
  FactoryBot.create(:category, title: cat, :with_doctors, doctors_count: 5)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?