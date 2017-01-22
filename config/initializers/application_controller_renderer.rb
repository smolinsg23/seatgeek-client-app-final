# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )
def send_message(phone_number, alert_message)
    account_sid = "AC5514246ab3ee29038c5ce49425d123ea"
 auth_token = "61b8cf3f31a88b613aa088f78bc0e47b"

        @client = Twilio::REST::Client.new account_sid, auth_token
        @twilio_number = "+13126354511" 
        message = @client.messages.create(
          :from => @twilio_number,
          :to => phone_number,
          :body => alert_message
        )
        puts message.to
      end



