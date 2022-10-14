# frozen_string_literal: true

class DoctorsController < ApplicationController
  before_action :set_category, only: :index
  authorize_resource
  
  def index
    @pagy, @doctors = pagy(filtered_doctors, items: Constants::Shared::ITEMS_PER_PAGE)
    @doctors = @doctors.decorate
  end

  private

  def set_category
    @category = @categories.find_by(id: params[:category_id])
  end

  def filtered_doctors
    @category.blank? ? Doctor.all : @category.doctors
  end
end
