class BidsController < ApplicationController
  def index 
    render 'index.html.erb'
end

def show
  @bid = Bid.find_by(id: params[:id])
end

def new
    @bid = Bid.new 
    if current_user && current_user.admin
      render 'new.html.erb'
    else
      redirect_to "/"
  end
end
def create 
  @bid = Bid.new(event_id: params[:event_id], user_id: params[:user_id], bid: params[:bid], lowest_price: params[:lowest_price])
     @bid.save
   flash[:success] = "Contact created."
      redirect_to "/bids/#{@bid.id}"
    end
end 
def update
     @bid = Bid.find_by(id: params[:id])

     @bid.first_name = params[:event_id]
     @bid.user_id = params[:user_id]
     @bid.bid = params[:bid]
     @bid.lowest_price = params[:lowest_price]
     @bid.save
     flash[:success] = "Bid updated."
     redirect_to "/users/#{@user.id}"
   end
   def destroy
     @bid = Bid.find_by(id: params[:id])
     @bid.destroy
     flash[:success] = "Contact deleted."
     redirect_to "/"
   end
 

