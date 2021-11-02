# frozen_string_literal: true

# controller for reviews
class ReviewsController < ApplicationController
  before_action :set_movie
  before_action :set_review, only: %i[show edit update destroy]
  before_action :ensure_user_is_owner_or_admin, only: %i[edit update destroy]

  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { render 'movies/show' }
      format.json { render :show, status: :ok, location: @review }
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to movie_path(@movie), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = @movie.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:movie_id, :comment, :score, :user_id).merge movie_id: @movie.id
  end

  def ensure_user_is_owner_or_admin
    return if @review.belongs_to_current_user?(current_user) || current_user.admin?

    flash[:alert] = 'Access denied!'
    redirect_back fallback_location: root_path
  end
end
