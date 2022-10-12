# frozen_string_literal: true

class CategoryDecorator < ApplicationDecorator
  delegate_all

  def clickable_doctors
    doctors.map { |doctor| link_to doctor.name, admin_doctor_path(doctor) }
  end
end
