# frozen_string_literal: true

RSpec.describe 'Users::Appointments', type: :request do
  let(:user) { create(:user) }

  describe 'Index of user`s appointments' do
    context 'when user is not authenticated' do
      before { get '/users/appointments?status=active' }

      it { is_expected.to redirect_to('/users/sign_in') }

      it 'sets flash alert message' do
        expect(flash[:alert]).to eq(I18n.t('devise.failure.unauthenticated'))
      end
    end

    context 'when user is signed in' do
      before { sign_in(user) }

      context 'with success response' do
        before { get '/users/appointments?status=active' }

        it 'has :ok status code' do
          expect(response).to have_http_status(:ok)
        end

        it 'renders index template' do
          expect(response).to render_template(:index)
        end
      end

      context 'with active `appointments' do
        let!(:active_appointments) { create_list(:appointment, 5, user: user) }

        before { get '/users/appointments?status=active' }

        it 'assigns user`s active appointments to @appointments' do
          expect(assigns(:appointments)).to match_array(active_appointments)
        end
      end

      context 'with closed appointments' do
        let!(:closed_appointments) { create_list(:appointment, 5, :closed, user: user) }

        before { get '/users/appointments?status=closed' }

        it 'assigns user`s closed appointments to @appointments' do
          expect(assigns(:appointments)).to match_array(closed_appointments)
        end
      end
    end
  end

  describe 'Show appointment' do
    let!(:appointment) { create(:appointment, :closed, user: user) }

    before { sign_in(user) }

    context 'with success response' do
      before { get "/users/appointments/#{appointment.id}" }

      it 'has :ok status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders show template' do
        expect(response).to render_template(:show)
      end

      it 'assigns user`s appointment with specified id' do
        expect(assigns(:appointment)).to eq(appointment)
      end
    end

    context 'when wrong appointment`s id' do
      before { get "/users/appointments/#{rand(1..100)}" }

      it 'redirects to 404 page' do
        expect(response).to redirect_to('/404')
      end
    end
  end

  describe 'Create appointment' do
    let!(:doctor) { create(:doctor) }
    let(:make_request) { post '/users/appointments', params: { doctor_id: doctor.id } }

    before { sign_in(user) }

    context 'when success' do
      before { |example| make_request unless example.metadata[:skip_request] }

      it 'changes appointments count in database', skip_request: true do
        expect { make_request }.to change(Appointment, :count).by(1)
      end

      it 'redirects to user`s appointments page' do
        expect(response).to redirect_to(users_appointments_path(status: 'active'))
      end

      it 'renders index template' do
        follow_redirect!
        expect(response).to render_template(:index)
      end

      it 'sets flash notice message' do
        follow_redirect!
        expect(flash[:notice]).to eq(I18n.t('users.appointments.create.appointment_created'))
      end
    end

    context 'when appointment to doctor already exists' do
      let!(:appointment) { create(:appointment, doctor: doctor, user: user) }

      before { make_request }

      it 'expect redirect to doctors index path' do
        expect(response).to redirect_to(doctors_path)
      end

      it 'sets flash alert message' do
        expect(flash[:alert]).to eq(I18n.t('users.appointments.create.appointment_exists'))
      end
    end

    context 'when doctor already has 10 active appointments' do
      let!(:appointments) { create_list(:appointment, 10, doctor: doctor) }

      before { make_request }

      it 'expect redirect to doctors index path' do
        expect(response).to redirect_to(doctors_path)
      end

      it 'sets flash alert message' do
        expect(flash[:alert]).to eq(I18n.t('users.appointments.create.appointments_count_reached'))
      end
    end
  end

  describe 'sign in and create appointment' do
    before { create(:doctor) }

    it 'signs in, creates appointment and redirect to user`s appointments page' do
      get '/users/sign_in'
      expect(response).to render_template(:new)

      post '/users/sign_in', params: { user: { phone_number: user.phone_number, password: user.password } }
      expect(response).to redirect_to(root_path)
      follow_redirect!

      get '/doctors'
      expect(response).to render_template(:index)

      post '/users/appointments', params: { doctor_id: Doctor.first.id }
      expect(response).to redirect_to(users_appointments_path(status: 'active'))
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include(I18n.t('users.appointments.create.appointment_created'))
    end
  end
end
