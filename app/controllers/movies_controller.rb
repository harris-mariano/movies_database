# frozen_string_literal: true

# controller for movies
class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :ensure_can_perform_action, except: %i[index show]
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
    @movie = Movie.find params[:movie_id]
    @movie.favorites.build(user_id: current_user.id)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully added to your favorites.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_year, :genre, :director, :summary, :image)
  end

  def ensure_can_perform_action
    redirect_back fallback_location: movies_url, notice: 'Unathorized to perform action' unless current_user&.admin?
  end
end
