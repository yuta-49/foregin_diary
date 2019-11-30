class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def  new
    @message = Message.new
  end

  def create
    Message.create(new_params)
  end
  
  def show
    @message = Message.find(params[:id])
  end


  private

  def message_params 
    params.require(:message).permit(:good, :bad, :improvement)
  end
  
  def new_params
    params.require(:message).permit(:good, :bad, :improvement)
  end

end
