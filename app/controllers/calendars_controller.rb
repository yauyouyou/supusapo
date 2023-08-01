class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  def new
    @calendar = Calendar.new
  end

  def show
    @calendar = Calendar.find(params[:id])
  end







  private

  def calendar_parameter
    params.require(:calendar).permit(:title, :content, :start_time, :end_time)
  end

end
