class UsersController < ApplicationController
  
  get '/signup' do
    erb :"/users/create_user"
  end
  
  post '/signup' do 
    @user = User.new(params)
    if @user.save
      session[:id] = @user.id
      redirect '/tweets'
    else 
      redirect '/signup'
    end
  end 

end
