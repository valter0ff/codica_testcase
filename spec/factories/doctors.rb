# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[ -]/, '') }
    password { FFaker::Internet.password.truncate(10) }
    password_confirmation { password }
    name { FFaker::Name.unique.name }
    expirience { FFaker::Number.number }
    description { FFaker::Lorem.paragraph }
    workplace { FFaker::Company.name }
    workplace_address { FFaker::AddressAU.full_address }
    category
  end
end
