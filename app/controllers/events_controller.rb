class EventsController < ApplicationController
  def index
    @events =[]
    @events = Unirest.get("https://api.seatgeek.com/2/events?datetime_utc.gt=2017-01-07&datetime_utc.lte=2017-01-30&geoip=104.18.37.48&range=20mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    @b = []
    @a = @events["events"]
    @b << @a

    
   render 'index.html.erb'
   end
  
 

    def show
    event_id = params[:eid]
    @events   = Unirest.get("https://api.seatgeek.com/2/events/#{params[:event_id]}").body

    render 'show.html.erb'
end
end

