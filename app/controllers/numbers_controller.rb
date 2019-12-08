class NumbersController < ApplicationController

  def index
    @numbers = Number.all
    gon.data = []
    gon.data << @numbers
  end

  def new
    @number = Number.new
  end

  def show
    @numbers = Number.find(params[:id])
    respond_to do |format|
      format.json
    end
  end

  def create
    @number = Number.new(number_params)
    @number.save
    redirect_to new_message_path
  end

  def get_number
    @show_number = Number.find(params[:id])
    respond_to do |format|
      format.json
    end
  end

  private
  def number_params
    params.require(:number).permit(:win, :lose,).merge(user_id: current_user.id)
  end
end
