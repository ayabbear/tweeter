class MentionsController < ApplicationController
  def index
    @mentions = Mention.all
  end

  def show
    @mention = Mention.find_by_name(params[:id])
    @tweets =  Mention.find_by(params[:name]).tweets.all
  end
end