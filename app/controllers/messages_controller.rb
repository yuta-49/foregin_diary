class MessagesController < ApplicationController
  
  before_action :move_to_index,  :except => :index
  def index
    messages = Message.all
  end

  def  new
    @message = Message.new
  end

  def create
    @message = Message.new(new_params)
    @message.save
    redirect_to root_path
  end
      
  def show
    @message = Message.find(params[:id])
    @messgae = Message.page(params[:page]).per(3).order("created_at DESC")
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.find(params[:id])
    if message.user.id == current_user.id
      message.update(message_params)
    else
      puts "この投稿を編集しますか？"
    end
    redirect_to root_path
  end

  def destroy
    message = Message.find(params[:id])
    if message.user.id == current_user.id
      message.destroy
    else
      puts "この投稿を削除しますか？"
    end
    redirect_to new_message_path
  end


  private
  def message_params 
    params.require(:message).permit(:user_id, :good, :bad, :improvement, :month_id, :day_id)
  end
  
  def new_params
    params.require(:message).permit(:good, :bad, :improvement, :month_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
