class SessionsController < ApplicationController
  def create
  	user = User.authentication(params[:username], params[:password])

  	if user
  		session[:user_id] = user.id
  		redirect_to root_path, :notice => "You have successfully logged in"
  	else
  		redirect_to root_path, :notice => "Wrong username or password"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end