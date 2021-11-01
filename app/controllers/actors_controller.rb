# frozen_string_literal: true

# controller for actors
class ActorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :ensure_user_is_admin, except: %i[index show]
  before_action :set_actor, only: %i[show edit update destroy]

  def index
    @actors = Actor.all.page params[:page]
  end

  def show; end

  def new
    @actor = Actor.new
  end

  def edit; end

  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to actors_path, notice: 'Actor was successfully created.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url, notice: 'Actor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_cast
    @actor = Actor.find params[:actor_id]
    @actor.casts.build(movie_id: params[:movie_id])

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Actor was successfully added to this movie.' }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:full_name, :image)
  end
end
