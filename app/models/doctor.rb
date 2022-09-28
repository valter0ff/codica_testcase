class Doctor < ApplicationRecord
  include ImageUploader::Attachment(:image)

  devise :database_authenticatable, :registerable, :rememberable, authentication_keys: [:phone_number]

  validates :phone_number, presence: true,
                           uniqueness: { allow_blank: true, if: :phone_number_changed? },
                           length: { maximum: Constants::Account::PHONE_NUMBER_MAX_SIZE },
                           format: { with: Constants::Account::PHONE_NUMBER_REGEXP,
                                     allow_blank: true,
                                     if: :phone_number_changed? }
  validates :password, presence: true, allow_blank: true,
                       confirmation: { on: :create },
                       length: { in: Constants::Account::PASSWORD_LENGTH }
  validates :experience, numericality: true

  belongs_to :category
end