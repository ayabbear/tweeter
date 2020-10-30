class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.paginate(:page => params[:page], :per_page=>12)
  end
end
