class Bid < ApplicationRecord
   belongs_to :user
  has_many :buy_now_bids
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
      
