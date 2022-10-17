# frozen_string_literal: true

class HomepageController < ApplicationController
  authorize_resource class: Category

  def index
    @categories_line = @categories.limit(Constants::Shared::HOMEPAGE_CATEGORIES_COUNT)
  end
end
