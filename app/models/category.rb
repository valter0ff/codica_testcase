# frozen_string_literal: true

class Category < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :title, presence: true, uniqueness: true

  has_many :doctors, dependent: :destroy
end
