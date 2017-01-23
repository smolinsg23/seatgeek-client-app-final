
  json.array! @bidds.each do |bidd|
   json.id bidd.id
   json.bid bidd.bid
   json.lowest_price bidd.lowest_price
   json.event_id bidd.event_id
  
end


