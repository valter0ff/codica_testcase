# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

I18n.t('categories_titles').each do |title|
  FactoryBot.create(:category, title: title, :with_doctors, doctors_count: 5)
end

FactoryBot.create_list(:user, 10)

30.times do 
  FactoryBot.create(:appointment, user: User.order('RANDOM()').take, doctor: Doctor.order('RANDOM()').take)
end

30.times do 
  FactoryBot.create(:appointment, :closed, user: User.order('RANDOM()').take, doctor: Doctor.order('RANDOM()').take)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')