class EventsController < ApplicationController
  def index
    if params["title"].present?
      @events = Unirest.get("https://api.seatgeek.com/2/events?q=#{params[:title]}&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    else
      city_geoip = "50.200.5.116"
      range = params[:radius] || "20"
      @events = Unirest.get("https://api.seatgeek.com/2/events?per_page=100&page=1&listing_count.gt=0&taxonomies.name=concert&datetime_utc.gt=2017-01-25&geoip=#{city_geoip}&range=#{range}mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
      @low = @events["performers"]
      
      

    end
    @b = []
    @c = []
    @a = @events["events"]
    @r = @events["events"][0]["performers"][0]["image"]
    p @r
     
    @b << @a
    @c << @r
  
   # <%@r.each  { |key, value| } %>
   # <img src="/events/<%=["image"][0]%>" 
   #    end
    render 'index.html.erb'
  end
 
  def show
    @events = Unirest.get("https://api.seatgeek.com/2/events/#{params[:id]}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    @low = @events["stats"]
    @venue = @events["venue"]["name"]
    @city = @events["venue"]["city"]

    #@events = Event.find_by(id: even)
    #@events = Unirest.get("https://api.seatgeek.com/2/events?sort=datetime_utc.asc&per_page=100&page=5&taxonomies.name=concert&datetime_utc.gt=2016-01-11&geoip=104.18.37.48&range=20mi&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
    render 'show.html.erb'
  end

end

