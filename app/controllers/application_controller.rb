# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def ensure_user_is_admin
    return if current_user.admin?

    flash[:alert] = 'Access denied!'
    redirect_to root_path
  end
end
