# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
name = ['sam', 'matt', 'ed', 'susan']
event_ids = [3513168, 3537633, 3537632, 3537634, 3537631, 3513137, 3641138, 3595283, 3641139, 3599444, 3634926, 3598073, 3572431]


name.each do |name|
  user = User.new(user_name: name, password: 'password')
  user.save
  10.times do 
    Bid.create(user_id: user.id, event_id: event_ids.sample, bid: rand(1..100), lowest_price: rand(1..100))
    
100.times do
 Buy_now_bid.create(bid_id: bid.id, lowest_price: rand(1..1000), average_price: rand(1..1000))
end
end
end



  

