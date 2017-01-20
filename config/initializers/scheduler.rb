   unless defined?(Rails::Console) || File.split($0).last == 'rake'
     s = Rufus::Scheduler.singleton
     s.every '1m', :tag => 'main_process' do
       Rails.logger.info "hello, it's #{Time.now}"
       Rails.logger.flush
       Bid.all.each do |bid|
         id = bid.event_id
          puts "*" * 50
          puts bid.id
          puts bid.event_id
          puts "*" * 50
           # @price = BuyNowBid.find_by(bid_id: params[:bid_id])
          @events = Unirest.get("https://api.seatgeek.com/2/events/#{id}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
          if @events["stats"]
            @low = @events["stats"]["lowest_price"] || 0
            @avg = @events["stats"]["average_price"] || 0
            BuyNowBid.create(bid_id: bid.id, lowest_price: @low , average_price: @avg)

            if @low <= bid.bid
              send_message("+13125501444", "Lowest price matched! Buy your ticket now!")
              bid.bid = 0
              bid.save
            end

          else
            puts 'problem with @events?'
            p @events
          end

          
       end
     end
   end
   

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
