class TweetsController < ApplicationController

  get "/tweets" do
    if logged_in?
      @tweets = Tweet.all
      @user = current_user
      erb :"/tweets/tweets"
    else 
       redirect "/login"
     end 
  end

  get 'tweets/new' do
    if logged_in?
      erb :"/tweets/new" 
    else
      redirect "/login"
    end
  end
  
end
