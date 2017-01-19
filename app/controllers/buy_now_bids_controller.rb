class BuyNowBidsController < ApplicationController
  def create
   @price = Buy_now_bid.new(bid_id: params[:bid_id], lowest_price: params[:lowest_price], average_price: params[:average_price])
   if session[:user_id] == current_user.id
      @bidd.save
      flash[:success] = "bid created."
      redirect_to "/users/#{current_user.id}"
   else
      flash[:warning] = 'please sign in'
      redirect_to '/login'
    end
    end
  end
 
   
 