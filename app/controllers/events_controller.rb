class EventsController < ApplicationController
  def index
    @events = []
    @events << Unirest.get("https://api.seatgeek.com/2/events/3539572?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    render 'index.html.erb'
  end
end


