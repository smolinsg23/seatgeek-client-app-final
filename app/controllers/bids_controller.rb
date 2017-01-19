class BidsController < ApplicationController
  def index 
    @bidds = Bid.all
    render 'index.html.erb'
  end

  def show
    #@bid?
    @bidds = Bid.find_by(id: params[:id])
  end



  def new
    @bidd = Bid.new 
    if current_user
      render 'new.html.erb'
    else
      redirect_to "/"
    end
  end
  def create 
    #@bid?
    #seatgeek id 
    @bidd = Bid.new(event_id: params[:event_id], user_id: session[:user_id], bid: params[:bid], lowest_price: params[:lowest_price])    
    if session[:user_id] == current_user.id
      @bidd.save
      send_message("+13125501444", "test")
      @events = Unirest.get("https://api.seatgeek.com/2/events/#{@bidd.event_id}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
      if @events["stats"]
        @low = @events["stats"]["lowest_price"] || 0
        @avg = @events["stats"]["average_price"] || 0
        BuyNowBid.create(bid_id: @bidd.id, lowest_price: @low , average_price: @avg)
      end
end
      # Rufus::Scheduler.singleton.every '10s' do
      #   @events = Unirest.get("https://api.seatgeek.com/2/events/#{@bidd.event_id}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
      #   if @events["stats"]
      #     @low = @events["stats"]["lowest_price"] || 0
      #     @avg = @events["stats"]["average_price"] || 0
      #     BuyNowBid.create(bid_id: @bidd.id, lowest_price: @low , average_price: @avg)
      #   end
      end
      flash[:success] = "bid created."
      redirect_to "/users/#{current_user.id}"
    else
      flash[:warning] = 'please sign in'
      redirect_to '/login'
    end
  end
  def update
    @bidds = Bid.find_by(id: params[:event_id])
       

       #@bidds.first_name = params[:event_id]
       #@bidds.first_name = params[:sg_id]

       @bidds.user_id = params[:user_id]
       @bidds.bid = params[:bid]
       @bidds.lowest_price = params[:lowest_price]
       @bidds.save
       flash[:success] = "Bid updated."
       redirect_to "/users/#{id}"
  end
  def destroy
   @bidds = Bid.find_by(id: params[:id])
   @bidds.destroy
   flash[:success] = "Contact deleted."
   redirect_to "/"
  end

  def send_message(phone_number, alert_message)
      account_sid = "AC5514246ab3ee29038c5ce49425d123ea"
auth_token = "386d158bb16c58248d0412ba8965dd92"
      twilio_number = "+13126354511"
      @client = Twilio::REST::Client.new account_sid, auth_token

      @client.messages.create(
        from: twilio_number,
        to:   phone_number,
        body: alert_message)
    end
    
  def match()
   if @bidds.bid == buy_now_bid.lowest_price
     send_message("+13125501444", "test")
   end
end
end


