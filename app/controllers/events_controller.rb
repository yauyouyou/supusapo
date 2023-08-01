class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def new
    @event = Event.new
    @selected_date = params[:date]
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: "予定が追加されました。"
    else
      render :new
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:content, :start_time, :end_time)
  end
end