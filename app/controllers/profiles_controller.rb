# frozen_string_literal: true

# controller for user profiles
class ProfilesController < ApplicationController
  before_action :ensure_can_perform_action, except: %i[index show]
  before_action :set_profile, only: %i[show edit update destroy]

  def index
    @profiles = Profile.all
  end

  def show; end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to profile_path(@user), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:full_name, :image)
  end
end
