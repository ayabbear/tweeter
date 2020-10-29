class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followee_id])
    current_user.follow(user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path) 
  end
end
