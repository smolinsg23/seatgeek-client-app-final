class Api::V1::BuyNowBidsController < ApplicationController
  def index
  @buys = BuyNowBid.all
  render 'index.json.jbuilder'
end
end
