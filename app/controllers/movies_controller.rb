# frozen_string_literal: true

# controller for movies
class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :ensure_user_is_admin, except: %i[index show add_to_favorites remove_from_favorites]
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @q = Movie.order(created_at: :desc).ransack(params[:q])
    @movies = @q.result.page params[:page]
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def edit; end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_cast
    @movie = Movie.find params[:movie_id]
    @movie.casts.build(actor_id: params[:actor_id])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully added to this actor.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
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

  def movie_params
    params.require(:movie).permit(:title, :release_year, :genre, :director, :summary, :image)
  end
end
