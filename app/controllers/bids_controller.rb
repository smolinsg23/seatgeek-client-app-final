class BidsController < ApplicationController
  def index 
    @bidds = Bid.all
    render 'index.html.erb'
  end
#  def set_price_check
#    BuyNowBidsController.price_check
# end

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

    @bidd = Bid.create!(event_id: params[:event_id], user_id: session[:user_id], bid: params[:bid], lowest_price: params[:lowest_price]) 
    BidEvent.find_or_create_by(event_id: params[:event_id], current_buy_now_price: params[:lowest_price], expiration_date: params[:expiration_date])   
    if session[:user_id] == current_user.id
      PriceMatchJob.run     
      send_message("+13125501444", "your bid has been created sit back while we find you your ticket")
         
      flash[:success] = "bid created."
      redirect_to "/users/#{current_user.id}"
      
    else
      flash[:warning] = 'please sign in'
      redirect_to '/login'
    
    
  end
end

  def update
    @bidds = Bid.find_by(id: params[:id])
    #@bidds.first_name = params[:event_id]
    #@bidds.first_name = params[:sg_id]
    
    @bidds.bid = params[:bid]
  
    @bidds.save

    flash[:success] = "Bid updated."
    redirect_to "/users/#{current_user.id}"
  end

  def destroy
    @bidds = Bid.find_by(id: params[:id])
    @bidds.destroy
    flash[:success] = "bid deleted."
    redirect_to "/"
  end

end
#     Rufus::Scheduler.singleton.jobs(:tag => 'main_process').each do |job|
#      Rufus::Scheduler.singleton.unschedule(job)
#     end
#     puts 'Starting rufus'
#     load "#{Rails.root}/config/initializers/scheduler.rb"
#   end
# end
#   def report
#     HardWorker.perform_async("10","20")
#     render text: "REQUEST TO GENERATE BIDS ADDED TO QUEUE"
#   end




 


