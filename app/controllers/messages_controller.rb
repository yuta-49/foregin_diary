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



  private
  def new_params
    params.require(:message).permit(:good, :bad, :improvement)
  end

end
