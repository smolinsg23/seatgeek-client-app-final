class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def send_message(phone_number, alert_message)
    account_sid = "AC5514246ab3ee29038c5ce49425d123ea"
 auth_token = "386d158bb16c58248d0412ba8965dd92"

        @client = Twilio::REST::Client.new account_sid, auth_token
        @twilio_number = "+13126354511" 
        message = @client.messages.create(
          :from => @twilio_number,
          :to => phone_number,
          :body => alert_message
        )
        puts message.to
      end




   def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
end



