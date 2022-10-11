# frozen_string_literal: true

module Doctors
  class AppointmentsController < ApplicationController
    before_action :set_appointment!, except: :index

    def index
      @appointments = current_doctor.appointments.where(status: params[:status])
      @pagy, @appointments = pagy(@appointments, items: Constants::Shared::ITEMS_PER_PAGE)
    end

    def show; end

    def edit; end

    def update
      if @appointment.closed?
        redirect_to appointment_path(@appointment), alert: t('.update_restricted')
      elsif @appointment.update(permitted_params)
        @appointment.closed!
        redirect_to doctors_appointments_path(status: 'closed'), notice: t('.appointment_updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_appointment!
      @appointment = current_doctor.appointments.find(params[:id])
    end
  
    def permitted_params
      params.require(:appointment).permit(:body)
    end
  end
end
