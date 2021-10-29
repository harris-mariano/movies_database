# frozen_string_literal: true

# controller for reviews
class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = Review.all
  end

  def show; end

  def new
    @review = Review.new
    @movie = Movie.find(params[:movie_id])
  end

  def edit
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render movie_path(params[:movie_id]), status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @movie = Movie.find(params[:movie_id])

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
    @movie = Movie.find(params[:movie_id])

    respond_to do |format|
      format.html { redirect_to movie_path(@movie), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:movie_id, :comment, :score)
  end
end
