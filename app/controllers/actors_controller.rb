# frozen_string_literal: true

# controller for actors
class ActorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_actor, only: %i[show]

  def show; end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end
end
