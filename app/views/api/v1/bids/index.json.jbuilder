
  json.array! @bids.each do |bid|
   json.id bid.id
   json.event_id bid.event_id
   json.user_id bid.user_id
   json.bid bid.bid
   json.lowest_price bid.lowest_price
   json.saved_bid bid.saved_bid
   json.buy_now_bids bid.buy_now_bids.each do |buy|
    json.buy
  
 end

