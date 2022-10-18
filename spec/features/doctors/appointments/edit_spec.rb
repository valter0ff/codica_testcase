# frozen_string_literal: true

RSpec.describe 'Doctors::Appointments->Edit', type: :feature do
  let(:appointments_edit_page) { Pages::Doctors::Appointments::Edit.new }
  let(:user) { create(:user) }
  let(:doctor) { create(:doctor) }
  let(:appointment) { create(:appointment, user: user, doctor: doctor) }
  let(:form) { appointments_edit_page.edit_appointment_form }

  before do
    sign_in(doctor)
    appointments_edit_page.load(id: appointment.id)
  end

  describe 'loading page elements' do
    context 'when page body' do
      let(:page_title) { I18n.t('doctors.appointments.edit.appointment_for', name: appointment.user.name) }

      it 'all elements present' do
        expect(appointments_edit_page).to have_page_title(text: page_title)
        expect(appointments_edit_page).to have_edit_appointment_form
        expect(form).to have_prescription_label(text: I18n.t('doctors.appointments.edit.enter_prescription'))
        expect(form).to have_prescription_input
        expect(form).to have_back_link(text: I18n.t('doctors.appointments.edit.back'))
        expect(form).to have_save_button
        expect(form.save_button.value).to eq(I18n.t('doctors.appointments.edit.save'))
      end
    end
  end

  describe 'submitting form' do
    before { form.fill_and_submit(params) }

    context 'with prescription field correct data' do
      let(:params) { attributes_for(:appointment, :closed) }
      let(:success_message) { I18n.t('doctors.appointments.update.appointment_updated') }

      it 'updates appointment`s prescription' do
        expect(appointment.reload.body).to eq(params[:body])
      end

      it 'redirects to doctor`s closed appointments page' do
        expect(appointments_edit_page).to have_current_path(doctors_appointments_path(status: :closed))
      end

      it 'shows success flash message' do
        expect(appointments_edit_page).to have_flash_notice(text: success_message)
      end
    end

    context 'with prescription field incorrect data' do
      let(:blank_error_message) { I18n.t('activerecord.errors.messages.blank') }
      let(:params) { { body: '' } }

      it 'shows errors messages in form' do
        expect(form).to have_body_error(text: blank_error_message)
      end
    end
  end
end
