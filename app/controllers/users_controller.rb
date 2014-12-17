class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
    permitted = params[:user].permit(:username, :email, :password, :password_confirmation)
  	@user = User.new(permitted)
    @user.user_role_id = 2

    if @user.save # u modelu definisali before_save
      redirect_to root_path, notice: "Successfully signed up! Welcome to Drustveni portal !"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.present?
      @user.destroy
    end
    redirect_to root_path
  end

end