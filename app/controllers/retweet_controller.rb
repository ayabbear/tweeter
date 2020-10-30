class RetweetController < ApplicationController
  def retweet
    @retweet = Tweet.new(retweet_params)
    @retweet.save
  end

  private

  def retweet_params
      params.require(:retweet).permit(:retweet_id, :status).merge(user_id: current_user.id)
  end
end
