# frozen_string_literal: true

RSpec.describe 'Homepages', type: :request do
  describe 'Visit a homepage' do
    let!(:categories) { create_list(:category, rand(2..10)) }

    before { get '/' }

    it { is_expected.to render_template(:index) }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns all categories to @categories' do
      expect(assigns(:categories)).to eq(Category.all)
    end
  end
end
