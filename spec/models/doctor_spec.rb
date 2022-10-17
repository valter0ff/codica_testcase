# frozen_string_literal: true

RSpec.describe Doctor, type: :model do
  subject(:doctor) { create(:doctor) }

  describe 'ActiveModel validations' do
    let(:errors_path) { %w[activerecord errors models doctor attributes] }
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
