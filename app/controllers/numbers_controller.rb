class NumbersController < ApplicationController

  def index
  end

  def new
    @number = Number.new
  end

  def create
    @number = Number.new(number_params)
    @number.save
    redirect_to new_message_path
  end

  private
  def number_params
    params.require(:number).permit(:win, :lose,).merge(user_id: current_user.id)
  end
end
