class CalendersController < ApplicationController

  def index
    @calenders = Calender.all

    respond_to do |format|
      format.json { render :json => @calenders}
    end
  end

  def new
    @calender = Calender.new
  end

  def create
    @calender = Calender.new(calender_params)
    @calender.attributes = {
      win: params[:data_win],
      lose: params[:data_lose],
    }
    @calender.save
    respond_to do |format|
      format.json {
        render :json
      }
    end
  end

  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy 
    render json: @calender
  end
  
  private
  def calender_params
    params.require(:calender).permit(:data_win, :data_lose).merge(user_id: current_user.id)
  end
end
