# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    user
    doctor

    trait :closed do
      body { FFaker::Lorem.paragraph }
      status { :closed }
    end
  end
end
