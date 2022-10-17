# frozen_string_literal: true

class Doctor < ApplicationRecord
  include ImageUploader::Attachment(:image)

  devise :database_authenticatable, :rememberable, authentication_keys: [:phone_number]

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
  validates :expirience, numericality: { only_integer: true }

  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :pacients, through: :appointments, source: :user
end
