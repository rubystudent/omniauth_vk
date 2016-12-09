class UsersController < ApplicationController
  before_action :authenticated

  private

  def current_resource
    @user = User.find(params[:id])
  end
end
