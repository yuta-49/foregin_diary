class DatasController < ApplicationController

  def index
  end

  def create
    @data = Data.new(Data_params)
    if @data.save
      respond_to do |format|
        format.json
      end
    end
  end
end
