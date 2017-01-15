class BidsController < ApplicationController
  def index 
    @bidds = Bid.all
    render 'index.html.erb'
  end

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
    #@bid?
    #seatgeek id 
    @bidd = Bid.new(event_id: params[:event_id], user_id: session[:user_id], bid: params[:bid], lowest_price: params[:lowest_price])
   
        
     if session[:user_id] == current_user.id
       @bidd.save
       flash[:success] = "bid created."
       redirect_to "/users/#{current_user.id}"
    else
       flash[:warning] = 'please sign in'
       redirect_to '/login'
     end
  end
  def update
    @bidds = Bid.find_by(id: params[:sg_id])
       

       #@bidds.first_name = params[:event_id]
       #@bidds.first_name = params[:sg_id]

       @bidds.user_id = params[:user_id]
       @bidds.bid = params[:bid]
       @bidds.lowest_price = params[:lowest_price]
       @bidds.save
       flash[:success] = "Bid updated."
       redirect_to "/users/#{id}"
  end
  def destroy
   @bidds = Bid.find_by(id: params[:id])
   @bidds.destroy
   flash[:success] = "Contact deleted."
   redirect_to "/"
  end
end


