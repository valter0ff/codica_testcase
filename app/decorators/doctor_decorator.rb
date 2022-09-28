# frozen_string_literal: true

class DoctorDecorator < ApplicationDecorator
  delegate_all

  def main_image
    return Constants::Account::MAIN_IMAGE_PLACEHOLDER unless object.image

    object.image_url(:large)
  end
end