require "pry"
class UsersController < ApplicationController
  
  get '/signup' do
    
    if logged_in?
      redirect "/tweets" 
    else
      erb :"users/create_user"
    end
  end
  
  post '/signup' do 
    @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect '/tweets'
    else 
      redirect '/signup'
    end
  end 

  get '/login' do
    if logged_in?
      redirect "/tweets" 
    else
      erb :"/users/login"
    end
  end
  
  post '/login' do
    @user = User.find_by(:username => params[:username])
    #binding.pry
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else 
      redirect to "/login"
    end
  end
end
