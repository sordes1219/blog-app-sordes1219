# frozen_string_literal: true

class FavoritesController < ApplicationController
  def index
    @articles = current_user.favorite_articles
  end
end
