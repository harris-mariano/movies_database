# frozen_string_literal: true

# home controller
class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @movies = Movie.order(created_at: :desc).first(3)
  end
end
