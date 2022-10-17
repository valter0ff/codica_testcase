# frozen_string_literal: true

RSpec.describe 'Homepages', type: :request do
  describe 'GET root_path' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
