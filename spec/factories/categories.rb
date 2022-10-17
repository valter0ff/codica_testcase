# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { FFaker::Book.unique.genre }

    transient do
      doctors_count { 2 }
    end

    trait :with_doctors do
      doctors { build_list(:doctor, doctors_count) }
    end

    trait :with_image do
      image { Rack::Test::UploadedFile.new('spec/fixtures/images/valid_image.jpg', 'image/jpeg') }
    end
  end
end
