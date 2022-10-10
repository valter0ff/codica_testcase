# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, authentication_keys: [:phone_number]

  validates :phone_number, presence: true,
                           uniqueness: { allow_blank: true, if: :phone_number_changed? },
                           length: { minimum: Constants::Account::PHONE_NUMBER_MIN_SIZE,
                                     maximum: Constants::Account::PHONE_NUMBER_MAX_SIZE },
                           format: { with: Constants::Account::PHONE_NUMBER_REGEXP,
                                     allow_blank: true,
                                     if: :phone_number_changed? }
  validates :password, presence: { on: :create },
                       confirmation: { on: :create },
                       length: { in: Constants::Account::PASSWORD_LENGTH,
                                 if: :encrypted_password_changed? }
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :appointments
  has_many :doctors, through: :appointments
end
