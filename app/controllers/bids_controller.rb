class BidsController < ApplicationController
  def index 
    @bids = Bid.all
    render 'index.html.erb'
  end

  def show
    #@bid?
    @bids = Bid.find_by(id: params[:id])
  end



  def new
    @bids = Bid.new 
    if current_user
      render 'new.html.erb'
    else
      redirect_to "/"
    end
  end
  def create 
    #@bid?
    #seatgeek id 
    @bid = Bid.new(event_id: params[:event_id], user_id: params[:user_id], bid: params[:bid], lowest_price: params[:lowest_price])
    @bid.save
    redirect_to "/users/#{current_user.id}"
        
     #if session[:user_id] == current_user.id
      # @bids.save
       #flash[:success] = "bid created."
       #redirect_to "/users/#{id}"
    #else
    #   flash[:warning] = 'please sign in'
    #   redirect_to '/login'
    # end
  end
  def update
    @bids = Bid.find_by(id: params[:sg_id])
       

       #@bids.first_name = params[:event_id]
       #@bids.first_name = params[:sg_id]

       @bids.user_id = params[:user_id]
       @bids.bid = params[:bid]
       @bids.lowest_price = params[:lowest_price]
       @bids.save
       flash[:success] = "Bid updated."
       redirect_to "/users/#{@user.id}"
  end
  def destroy
   @bids = Bid.find_by(id: params[:id])
   @bids.destroy
   flash[:success] = "Contact deleted."
   redirect_to "/"
  end
end


