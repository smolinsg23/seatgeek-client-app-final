class Bid < ApplicationRecord
   belongs_to :user
  has_many :buy_now_bids
  scope :not_matched, -> {where("saved_bid IS NULL")}
  after_create do |bid|
    BidEvent.find_or_create_by(event_id: bid.event_id, current_buy_now_price: bid.lowest_price)

    

  end

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
      
