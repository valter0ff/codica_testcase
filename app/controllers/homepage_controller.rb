# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @categories_line = @categories.limit(Constants::Shared::HOMEPAGE_CATEGORIES_COUNT)
  end
end
