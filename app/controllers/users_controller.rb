class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params.require(:user).permit(:username, :email))
    if @user.save
      render "show"
    else
      
    end
  end
end
