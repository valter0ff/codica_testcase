# frozen_string_literal: true

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'ActiveModel validations' do
    let(:errors_path) { %w[activerecord errors models user attributes] }
    let(:blank_error) { I18n.t('activerecord.errors.messages.blank') }

    context 'when phone_number' do
      it_behaves_like 'phone_number validations'
    end

    context 'when password' do
      it_behaves_like 'password validations'
    end

    context 'when name' do
      it_behaves_like 'name validations'
    end
  end

  describe 'database columns exists' do
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'database indexes exists' do
    it { is_expected.to have_db_index(:phone_number) }
    it { is_expected.to have_db_index(:name) }
  end
end
