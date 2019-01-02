class TweetsController < ApplicationController

  get "/tweets" do
    @tweets = Tweet.all
    @user = current_user
    erb :"/tweets/tweets"
  end

end
