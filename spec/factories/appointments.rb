# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    user
    doctor
    status { :active }
    body { FFaker::Lorem.paragraph }
  end
end
