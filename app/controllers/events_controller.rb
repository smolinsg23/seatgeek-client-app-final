class EventsController < ApplicationController
  def index
    if params["title"].present?
      @events = Unirest.get("https://api.seatgeek.com/2/events?q=#{params[:title]}&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    else
      @events = Unirest.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&per_page=100&page=5&taxonomies.name=concert&datetime_utc.gt=2012-09-07&geoip=104.18.37.48&range=20mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    end
    @b = []
    @a = @events["events"]
    @b << @a
      
    render 'index.html.erb'
  end
 
  def show
    @events = Unirest.get("https://api.seatgeek.com/2/events/#{params[:id]}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    @low = @events["stats"].each do |x|
    end

    #@events = Event.find_by(id: even)
    #@events = Unirest.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&per_page=100&page=5&taxonomies.name=concert&datetime_utc.gt=2016-01-11&geoip=104.18.37.48&range=20mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    render 'show.html.erb'
  end
end

