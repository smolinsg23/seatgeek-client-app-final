json.array! @buys.each do |buy|
   json.id buy.id
   json.bid_id buy.bid_id
   json.lowest_price buy.lowest_price
   
   json.average_price buy.average_price
   json.created_at buy.created_at
   json.updated_at buy.updated_at
  end