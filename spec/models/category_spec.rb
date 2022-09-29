# frozen_string_literal: true

RSpec.describe Category, type: :model do
  subject(:category) { create(:category) }

  describe 'ActiveModel validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe 'database columns exists' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
  end

  describe 'database indexes exists' do
    it { is_expected.to have_db_index(:title) }
  end
end
