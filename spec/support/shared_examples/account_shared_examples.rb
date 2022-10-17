# frozen_string_literal: true

RSpec.shared_examples 'phone_number validations' do
  let(:taken_error) { I18n.t('phone_number.taken', scope: errors_path) }
  let(:invalid_error) { I18n.t('phone_number.invalid', scope: errors_path) }
  let(:valid_phone_number) { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[ -]/, '') }
  let(:phone_number_min_size) { Constants::Account::PHONE_NUMBER_MIN_SIZE }
  let(:phone_number_max_size) { Constants::Account::PHONE_NUMBER_MAX_SIZE }

  it { is_expected.to validate_presence_of(:phone_number).with_message(blank_error).on(:create) }
  it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive.with_message(taken_error) }
  it { is_expected.to validate_length_of(:phone_number).is_at_least(phone_number_min_size) }
  it { is_expected.to validate_length_of(:phone_number).is_at_most(phone_number_max_size) }
  it { is_expected.to allow_value(valid_phone_number).for(:phone_number) }
  it { is_expected.not_to allow_value(FFaker::Lorem.word).for(:phone_number).with_message(invalid_error) }
end

RSpec.shared_examples 'password validations' do
  let(:password_min_size) { Constants::Account::PASSWORD_LENGTH.begin }
  let(:password_max_size) { Constants::Account::PASSWORD_LENGTH.end }

  it { is_expected.to validate_presence_of(:password).with_message(blank_error).on(:create) }
  it { is_expected.to validate_length_of(:password).is_at_least(password_min_size).is_at_most(password_max_size) }
end

RSpec.shared_examples 'name validations' do
  let(:taken_error) { I18n.t('name.taken', scope: errors_path) }

  it { is_expected.to validate_presence_of(:name).with_message(blank_error) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive.with_message(taken_error) }
end
