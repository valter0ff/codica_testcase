# frozen_string_literal: true

RSpec.describe 'Doctors', type: :request do
  let!(:categories) { create_list(:category, categories_count, :with_doctors, doctors_count: doctors_count) }
  let(:categories_count) { rand(2..10) }
  let(:doctors_count) { rand(2..10) }

  describe 'Index of doctors' do
    context 'when category not specified' do
      before { get '/doctors' }

      it { is_expected.to render_template(:index) }

      it 'has a 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      context 'when doctors count less then items per page can be viewed' do
        let(:categories_count) { 2 }
        let(:doctors_count) { 2 }

        it 'assigns all doctors to @doctors' do
          expect(assigns(:doctors)).to match_array(Doctor.all)
        end
      end

      context 'when doctors count more then items per page can be viewed' do
        let(:categories_count) { 5 }
        let(:doctors_count) { 5 }

        it 'assigns limited doctors to @doctors' do
          expect(assigns(:doctors)).to match_array(Doctor.limit(Constants::Shared::ITEMS_PER_PAGE))
        end
      end
    end

    context 'when category specified' do
      before { get "/doctors?category_id=#{categories.first.id}" }

      it 'assigns doctors of specified category to @doctors' do
        expect(assigns(:doctors)).to match_array(Category.first.doctors)
      end
    end
  end
end
