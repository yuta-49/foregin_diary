class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @users = user.messages.page(params[:page]).per(4).order("created_at DESC")
    @messages = current_user.messages.page(params[:page]).per(4)
    @nickname = current_user.nickname 
  end

  def mypage_search
    user = User.find(params[:id])
    @users = user.messages.page(params[:page]).per(4).search(params)
  end
end
