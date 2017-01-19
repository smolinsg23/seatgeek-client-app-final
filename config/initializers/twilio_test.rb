# require 'twilio-ruby'

# # To find these visit https://www.twilio.com/user/account
# account_sid = "AC5514246ab3ee29038c5ce49425d123ea"
# auth_token = "386d158bb16c58248d0412ba8965dd92"

# @client = Twilio::REST::Client.new account_sid, auth_token
# from = "+13126354511",
# friends = {'+13125501444' => "sam"}
# friends.each do |key, value|
# message = @client.messages.create(
#   :from => from,
#   :to => key,
#   :body => "Hey #{value}, you have donkey brains"
# )
# puts "sent message to #{value}"
# end