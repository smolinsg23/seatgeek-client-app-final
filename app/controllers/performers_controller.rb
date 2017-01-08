class PerformersController < ApplicationController
  def show
    performers_id = params[:id]
    @events   = Unirest.get("https://api.seatgeek.com/2/events/#{params[:id]}").body
end
