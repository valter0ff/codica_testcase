# frozen_string_literal: true

RSpec.describe Doctor, type: :model do
  subject(:doctor) { create(:doctor) }

  describe 'ActiveModel validations' do
    let(:errors_path) { %w[activerecord errors models doctor attributes] }
    let(:blank_error) { I18n.t('activerecord.errors.messages.blank') }

    context 'when phone_number' do
      let(:taken_error) { I18n.t('phone_number.taken', scope: errors_path) }
      let(:invalid_error) { I18n.t('phone_number.invalid', scope: errors_path) }
      let(:valid_phone_number) { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/[ -]/,'') }
      let(:phone_number_min_size) { Constants::Account::PHONE_NUMBER_MIN_SIZE }
      let(:phone_number_max_size) { Constants::Account::PHONE_NUMBER_MAX_SIZE }

      it { is_expected.to validate_presence_of(:phone_number).with_message(blank_error).on(:create) }
      it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive.with_message(taken_error) }
      it { is_expected.to validate_length_of(:phone_number).is_at_least(phone_number_min_size) }
      it { is_expected.to validate_length_of(:phone_number).is_at_most(phone_number_max_size) }
      it { is_expected.to allow_value(valid_phone_number).for(:phone_number) }
      it { is_expected.not_to allow_value(FFaker::Lorem.word).for(:phone_number).with_message(invalid_error) }
    end

    context 'when password' do
      let(:password_min_size) { Constants::Account::PASSWORD_LENGTH.begin }
      let(:password_max_size) { Constants::Account::PASSWORD_LENGTH.end }

      it { is_expected.to validate_presence_of(:password).with_message(blank_error).on(:create) }
      it { is_expected.to validate_length_of(:password).is_at_least(password_min_size).is_at_most(password_max_size) }
    end

    context 'when name' do
      let(:taken_error) { I18n.t('name.taken', scope: errors_path) }

      it { is_expected.to validate_presence_of(:name).with_message(blank_error) }
      it { is_expected.to validate_uniqueness_of(:name).case_insensitive.with_message(taken_error) }
    end


    context 'when expirience' do
      it { is_expected.to validate_numericality_of(:expirience).only_integer }
    end
  end

  describe 'database columns exists' do
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:expirience).of_type(:integer) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:workplace).of_type(:string) }
    it { is_expected.to have_db_column(:workplace_address).of_type(:string) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:category_id).of_type(:integer) }
  end

  describe 'database indexes exists' do
    it { is_expected.to have_db_index(:phone_number) }
    it { is_expected.to have_db_index(:name) }
  end

  describe 'associatios' do
    it { is_expected.to belong_to(:category) }
  end
end
