# frozen_string_literal: true

# controller for movies
class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_movie, only: %i[show]

  def index
    @q = Movie.order(created_at: :desc).ransack(params[:q])
    @movies = @q.result.page params[:page]
  end

  def show
    @review = current_user&.reviews&.new
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
