class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  

end
