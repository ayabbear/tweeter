class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @users = User.all
    @user = User.find_by_username(params[:id])
  end
end
