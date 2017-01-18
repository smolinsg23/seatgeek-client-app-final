require 'twilio-ruby'

# To find these visit https://www.twilio.com/user/account
account_sid = ""
auth_token = ""

@client = Twilio::REST::Client.new account_sid, auth_token
from = "+",
friends = {'+' => "matt"}
friends.each do |key, value|
message = @client.messages.create(
  :from => from,
  :to => key,
  :body => "Hey #{value}, you have donkey brains"
)
puts "sent message to #{value}"
end