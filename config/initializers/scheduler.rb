   unless defined?(Rails::Console) || File.split($0).last == 'rake'
     s = Rufus::Scheduler.singleton
     s.every '10m' do
       Rails.logger.info "hello, it's {Time.now}"
       Rails.logger.flush
       Bid.all.each do |bid|
         id = bid.event_id
        @events = Unirest.get("https://api.seatgeek.com/2/events/#{id}?&client_id=NjQwNTEzMXwxNDgxNDkxODI1").body
        if @events["stats"]
          @low = @events["stats"]["lowest_price"] || 0
          @avg = @events["stats"]["average_price"] || 0
          BuyNowBid.create(bid_id: bid.id, lowest_price: @low , average_price: @avg)
        end
      end 
    end
  end