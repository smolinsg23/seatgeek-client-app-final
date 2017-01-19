class Bid < ApplicationRecord
   belongs_to :user
  has_many :buy_now_bids
 

 
    
 #    def send_message(phone_number, alert_message)
 #      account_sid = "AC5514246ab3ee29038c5ce49425d123ea"
 # auth_token = "386d158bb16c58248d0412ba8965dd92"
 #      twilio_number = "+13126354511"
 #      @client = Twilio::REST::Client.new account_sid, auth_token
 #    end
      def match(bid_id)

        @match = bid_id
      end
    def match 
    @bidds.each do |bid|

      if @match == bid.id && bid.bid == bid.lowest_price
        return @match
      end
    end
      
    #bid 
    #== buy_now_bid["lowest_price"]
     
   

   end
 
 
  #  def rufus
  #       Rufus::Scheduler.singleton.every '10s' do
  #        id = @bidd.event_id
  #        @events = Unirest.get("https://api.seatgeek.com/2/events/{id}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
  #        if @events["stats"]
  #          @low = @events["stats"]["lowest_price"] || 0
  #          @avg = @events["stats"]["average_price"] || 0
  #          BuyNowBid.create(bid_id: @bidd.id, lowest_price: @low , average_price: @avg)
  #        end
  #      end
  #    end
      end
