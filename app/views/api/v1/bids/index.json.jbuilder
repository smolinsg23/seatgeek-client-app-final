
  json.array! @bids.each do |bid|
   json.id bid.id
   json.event_id bid.event_id
   json.user_id bid.user_id
   json.bid bid.bid
   json.lowest_price bid.lowest_price
   json.matched_price bid.matched_price
  
  
 end

