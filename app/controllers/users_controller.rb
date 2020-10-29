class UsersController < ApplicationController
  def show
    @users = User.all
    @user = User.find_by_username(params[:id])
  end
end
