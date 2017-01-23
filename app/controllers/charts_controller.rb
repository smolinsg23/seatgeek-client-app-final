class ChartsController < ApplicationController
   # def buy_now_bid_over_time
   #  result = BuyNowBid.group(:lowest_price).count
   #  render json: [{average_price: 'Count', id: 'count', bid_id: 'count', created_at: data: result}]
   def buy_now_bid_over_time
  # result = BuyNowBid.group_by_hour(:created_at, format: "%H").count
  result = Bid.find_by(id: params[:bid_id]).buy_now_bids.map {|bnb| [bnb.created_at, bnb.lowest_price]}.to_h
  puts "*" * 50
  p result
  puts "*" * 50
  render json: [{lowest_price: params[:lowest_price], average_price: params[:average_price], id: params[:id], bid_id: params[:bid_id], data: result}]
end
  end


