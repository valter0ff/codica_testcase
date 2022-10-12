# frozen_string_literal: true

module Doctors
  class PacientsController < ApplicationController
    # before_action :set_appointment!, except: :index

    def index
      @pagy, @pacients = pagy(current_doctor.pacients, items: Constants::Shared::ITEMS_PER_PAGE)
    end

    def show
      @pacient = current_doctor.pacients.find(params[:id])
      @appointments = @pacient.appointments.where(doctor_id: current_doctor.id)
      @pagy, @appointments = pagy(@appointments, items: Constants::Shared::ITEMS_PER_PAGE)
    end
  end
end