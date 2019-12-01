class MessagesController < ApplicationController
  
  before_action :move_to_index,  :except => :index
  def index
    @messages = Message.all.includes(:user).order("created_at DESC")
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
