class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets

    likes = Like.where(user_id: current_user.id).order(created_at: :desc).pluck(:tweet_id)
    @likes = Tweet.find(likes)
  end
end
