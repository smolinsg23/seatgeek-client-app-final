class BidEvent < ApplicationRecord
  has_many :bids, foreign_key: :event_id, primary_key: :event_id
  scope :active_events, -> {where('expiration_date > ?', Time.now)}
  
  after_save do |bid_event|
    if bid_event.current_buy_now_price_changed?
      BidEventHistory.create bid_event_id: bid_event.id, lowest_price: bid_event.current_buy_now_price

    end  

  end  

  def matching_bids low 
    bids.not_matched.select do |bid|
      bid.bid >= low 
    end 

  end

  def unmatched_bids low
    bids.not_matched.select do |bid|
      bid.bid < low
  end
end
  def update_current_buy_now_price(new_price)
      update_attribute(:current_buy_now_price, new_price)
  end

end 