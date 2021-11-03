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

  def add_to_favorites
    current_user.favorites.build(movie_id: params[:movie_id]).save

    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: 'Movie was successfully added to your favorites.' }
      format.json { render :show, status: :created, location: @movie }
    end
  end

  def remove_from_favorites
    current_user.favorites.find_by(movie_id: params[:movie_id]).destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: 'Movie was successfully removed from your favorites.' }
      format.json { render :show, status: :created, location: @movie }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
