# frozen_string_literal: true

class HomepageController < ApplicationController
  def index
    @categories = Category.limit(Constants::Shared::HOMEPAGE_CATEGORIES_COUNT)
  end
end
