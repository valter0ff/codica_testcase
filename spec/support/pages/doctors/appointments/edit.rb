# frozen_string_literal: true

module Pages
  module Doctors
    module Appointments
      class Edit < SitePrism::Page
        set_url '/doctors/appointments/{id}/edit'

        element :flash_notice, '#flash_notice'
        element :page_title, '.page-title'

        section :edit_appointment_form, '.edit_appointment' do
          element :prescription_label, '.prescription-label'
          element :prescription_input, '.prescription-input'
          element :back_link, '.back-link'
          element :save_button, 'input.save-btn'
          element :body_error, '#body-error'

          def fill_and_submit(params)
            prescription_input.set(params[:body])
            save_button.click
          end
        end
      end
    end
  end
end
