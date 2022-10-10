# frozen_string_literal: true

module Users
  class AppointmentsController < ApplicationController
    def index
      @appointments = current_user.appointments.where(status: params[:status])
    end

    def show
      @appointment = current_user.appointments.find(params[:id])
    end
  
    def create
      if find_active_appointment.present?
        redirect_back_or_to doctors_path, alert: t('.appointment_exists')
      elsif appointments_count_reached?
        redirect_back_or_to doctors_path, alert: t('.appointments_count_reached')
      elsif current_user.appointments.create(permitted_params)
        redirect_to users_appointments_path(status: 'active'), notice: t('.appointment_created')
      else
        redirect_to root_path, status: :unprocessable_entity
      end
    end

    private

    def find_active_appointment
      current_user.appointments.where(doctor_id: params[:doctor_id]).active
    end

    def appointments_count_reached?
      find_doctor!.appointments.count >= Constants::Shared::MAX_DOCTOR_APPOINTMENT_COUNT
    end
      
    def find_doctor!
      Doctor.find(params[:doctor_id])
    end

    def permitted_params
      params.permit(:doctor_id)
    end
  end
end
