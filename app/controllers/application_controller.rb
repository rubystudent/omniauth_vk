# frozen_string_literal: true
# application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticated
    redirect_to login_path unless current_user
  end

  def unauthenticated
    redirect_to user_path(current_user) if current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
