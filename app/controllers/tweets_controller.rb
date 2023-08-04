class TweetsController < ApplicationController
  def index
    @tweets = Tweet.where(category: "post").order(upload_date: :desc)
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
  end

  def new; end
  def edit; end

  def update; end

  def destroy; end
end
