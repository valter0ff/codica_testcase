# frozen_string_literal: true

RSpec.describe Appointment, type: :model do
  subject(:appointment) { create(:appointment) }

  describe 'ActiveModel validations' do
    let(:blank_error) { I18n.t('activerecord.errors.messages.blank') }

    it { is_expected.to validate_presence_of(:body).on(:update).with_message(blank_error) }
  end

  describe 'database columns exists' do
    it { is_expected.to have_db_column(:body).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:integer).with_options(default: :active) }
    it { is_expected.to have_db_column(:doctor_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  end

  describe 'database indexes exists' do
    it { is_expected.to have_db_index(:doctor_id) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'associatios' do
    it { is_expected.to belong_to(:doctor) }
    it { is_expected.to belong_to(:user) }
  end
end
