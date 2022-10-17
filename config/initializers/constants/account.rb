# frozen_string_literal: true

module Constants
  module Account
    PHONE_NUMBER_REGEXP = /\A\+[0-9]+\z/
    PHONE_NUMBER_MIN_SIZE = 10
    PHONE_NUMBER_MAX_SIZE = 16
    PASSWORD_LENGTH = 5..10
    MAIN_IMAGE_PLACEHOLDER = 'doctor_male.png'
  end
end
