class PriceMatchJob < ApplicationJob


  cattr_accessor :running
  @@running = false
 
  def send_message(phone_number, alert_message)
    account_sid = "AC5514246ab3ee29038c5ce49425d123ea"
    auth_token = "a8fe7cd1270f98e01850d93602d87a74"

    client = Twilio::REST::Client.new account_sid, auth_token
    twilio_number = "+13126354511"
    message = client.messages.create(
      :from => twilio_number,
      :to => phone_number,
      :body => alert_message
    )
    puts "does it work"
    puts message.to
    puts "does it work"

  end
  
  def self.run
    print self.running?
     unless self.running?
      enqueue # `perform` will be excuted 60 sec. later
  
      self.start!
    end   
  end
  def self.running?
     running == true
 end     
  def self.start! 
    self.running = true
  end   
  def self.stop! 
    self.running  = false
  end  
  DELAY= 10.seconds
  def self.enqueue

     PriceMatchJob.set(wait: DELAY).perform_later 
  end  
  def perform
    Rails.logger.info "Starting Price Match Job at #{Time.now}"
    active_events  = BidEvent.active_events 
    unmatched_bids=[]
    active_events.each do |bid_event|
      event_id = bid_event.event_id
      puts "*" * 50
      puts event_id
      puts event_id
      puts "*" * 50
      events = Unirest.get("https://api.seatgeek.com/2/events/#{event_id}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body


      if events["stats"] && events["stats"]["listing_count"] && events["stats"]["listing_count"] > 0
        low = events["stats"]["lowest_price"]

        avg = events["stats"]["average_price"]
        bid_event.matching_bids(low).each do |bid|


          send_message("+13125501444", "Lowest price matched for #{events["title"]} with a bid_event id of #{event_id}Buyyour ticket now for #{low}")
          bid.update_column(:matched_price, low)
        end
       if low != bid_event.current_buy_now_price
          bid_event.update_current_buy_now_price(low)
        end

        if unmatched_bids.empty?

        unmatched_bids = bid_event.unmatched_bids(low) 
        print bid_event.unmatched_bids(low)
      end
      end
    end
    Rails.logger.info "End Price Match Job at #{Time.now}" 
    if active_events.empty? || unmatched_bids.empty?
      print "stop!"
      self.class.stop!
    else
     self.class.enqueue  
    end  
end
end