class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @users = user.messages.page(params[:page]).per(4).order("created_at DESC")
    @messages = current_user.messages.page(params[:page]).per(4)
    @nickname = current_user.nickname 
  end

  def search_result
    @nickname = current_user.nickname 
    @messages = current_user.messages.page(params[:page]).per(4)
    if 
      @users = current_user.messages.where(['good LIKE ?', "%#{params[:good]}%"]).page(params[:page]).per(4) #検索とuseanameの部分一致を表示。
    else
      @users = User.none
    end
  
  end
end
