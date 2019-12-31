class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @users = user.messages.page(params[:page]).per(4).order("created_at DESC")
    @messages = current_user.messages.page(params[:page]).per(4)
    @nickname = current_user.nickname 
  end

  def mypage_search
    if params[:good].present?
      @user_good = User.where('good LIKE', "%#{params[:good]}%")
    else
      @users = User.none
    end
  end
end
