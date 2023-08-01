class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    @calendars = Calendar.new
  end
  
end
