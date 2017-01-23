class Api::V1::BidsController < ApplicationController
  def index
    @bids = Bid.all
    render 'index.json.jbuilder'
  end
end
