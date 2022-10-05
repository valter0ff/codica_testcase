# frozen_string_literal: true

class DoctorsController < ApplicationController
  include Pagy::Backend

  ITEMS_PER_PAGE = 12

  before_action :set_category, only: :index

  def index
    @doctors = filtered_doctors.decorate
    @pagy, @doctors = pagy_array(@doctors.to_a, items: ITEMS_PER_PAGE, link_extra: 'data-remote="true"')
    respond_to :html, :js
  end

  private

  def set_category
    @category = @categories.find_by(id: params[:category_id])
  end

  def filtered_doctors
    @category.blank? ? Doctor.all : @category.doctors
  end
end
