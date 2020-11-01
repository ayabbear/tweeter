class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet = Tweet.new
    @tweets = Tweet.where(user_id: current_user.followees.select(:id)).or(Tweet.where(user_id: current_user.id)).paginate(:page => params[:page], :per_page=>6).order("created_at DESC")
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.save

    @tag_array = @tweet.body.scan(/#\w+\b/)
    unless @tag_array == []
      @tag_array.each do |tag|
        @tag = Tag.find_or_initialize_by(name: tag)
        @tag.save
        @tweet.tags << @tag
      end
    end

    @mention_array = @tweet.body.scan(/@\w+\b/)
    unless @mention_array == []
      @mention_array.each do |mention|
        @mention = Mention.find_or_initialize_by(name: mention)
        @mention.save
        @tweet.mentions << @mention
      end
    end

    redirect_to tweets_path
  end

  def destroy
    Tweet.destroy(params[:id])
    redirect_to tweets_path
  end

  def retweet
    original_tweet = Tweet.find(params[:id])

    @retweet = Tweet.new(
      user_id: current_user.id,
      body: original_tweet.body
    )
    @retweet.save

    @tag_array = @retweet.body.scan(/#\w+\b/)
    unless @tag_array == []
      @tag_array.each do |tag|
        @tag = Tag.find_or_initialize_by(name: tag)
        @tag.save
        @retweet.tags << @tag
      end
    end

    @mention_array = @retweet.body.scan(/@\w+\b/)
    unless @mention_array == []
      @mention_array.each do |mention|
        @mention = Mention.find_or_initialize_by(name: mention)
        @mention.save
        @retweet.mentions << @mention
      end
    end

    redirect_to tweets_path
  end
  
  private
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
