class UsersController < ApplicationController
  def show
    @users = User.includes(:messages).page(params[:page]).per(5)
    @user = User.find(params[:id])
    @nickname = @user.nickname 
  end
end
