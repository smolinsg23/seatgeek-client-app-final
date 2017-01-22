class EventsController < ApplicationController
  def index
    if params["title"].present?
      @events = Unirest.get("https://api.seatgeek.com/2/events?q=#{params[:title]}&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    else
      @events = Unirest.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&per_page=100&page=5&taxonomies.name=concert&datetime_utc.gt=2017-01-01&geoip=104.18.37.48&range=20mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
      @low = @events["performers"]
    end
    @b = []
    @c = []
    @a = @events["events"]
    @r = @events["performers"]
     
    # @b << @a
    # @c << @r
   # @c.each do |performer|
   #<%@r.each  { |key, value| } %>
   #<img src="/events/<%key[0], value["image"]%>" 
      
    render 'index.html.erb'
  end
 
  def show
    @events = Unirest.get("https://api.seatgeek.com/2/events/#{params[:id]}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    @low = @events["stats"]

    #@events = Event.find_by(id: even)
    #@events = Unirest.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&per_page=100&page=5&taxonomies.name=concert&datetime_utc.gt=2016-01-11&geoip=104.18.37.48&range=20mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    render 'show.html.erb'
  end
end

