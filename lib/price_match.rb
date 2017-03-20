class PriceMatch
  def self.send_message(phone_number, alert_message)
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



  def self.perform
    Rails.logger.info "hello, it's #{Time.now}"
    Rails.logger.flush
    BidEvent.active_events.each do |bid_event|
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
      end

    end
  end














  def self.send_message(phone_number, alert_message)
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
end
