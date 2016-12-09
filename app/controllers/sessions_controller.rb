# frozen_string_literal: true
# sessions controller
class SessionsController < ApplicationController
  before_action :authenticated, only: :destroy
  before_action :unauthenticated, only: [:new, :create]
  def create
    @account = Account.find_by(account_params)
    @account = Account.create(account_params.merge(find_or_create_user)) unless @account
    session[:user_id] = @account.user_id
    redirect_to @account.user
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end

  def account_params
    { uid: auth_params['uid'], provider: auth_params['provider'] }
  end

  def find_or_create_user
    { user: User.find_or_create_by(email: auth_params['info']['email']) }
  end
end
