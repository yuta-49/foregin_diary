class CalendersController < ApplicationController
  
  def index
    @calenders = current_user.calenders.all

    respond_to do |format|
      format.json { render :json => @calenders}
    end
  end

  def new
    @calender = Calender.new
  end

  def create
    @calender  = Calender.new
    @calender.attributes = {
      user_id: current_user.id,
      title: params[:title],
      start: params[:start],
      end: params[:end],
    }
    @calender.save
    respond_to do |format|
      format.json {
        render json:
        @calender.to_json(
          only: [:id, :title, :start, :end]
        )
      }
    end
  end

  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy 
    render json: @calender
  end
  
  private

  def  set_calender
    @calender = Calender.find(params[:id])
  end

  def calender_params
    params.require(:calender).permit(:title, :start, :end).merge(user_id: current_user.id)
  end
end
