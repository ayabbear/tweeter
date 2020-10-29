class MentionsController < ApplicationController
  def index
    @mentions = Mention.all
  end

  def show
    @mention = Mention.find_by_name(params[:id])
    @tweets = @mention.tweets.all
  end
end
