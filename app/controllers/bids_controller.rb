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
    @bidd = Bid.new(event_id: params[:event_id], user_id: session[:user_id], bid: params[:bid], lowest_price: params[:lowest_price])    
    if session[:user_id] == current_user.id
      @bidd.save
      send_message("+13125501444", "test")
      restart_jobs
      flash[:success] = "bid created."
      redirect_to "/users/#{current_user.id}"
    else
      flash[:warning] = 'please sign in'
      redirect_to '/login'
    end
  end

  def update
    @bidds = Bid.find_by(id: params[:event_id])
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

  def restart_jobs
    puts 'Stopping rufus'
    Rufus::Scheduler.singleton.jobs(:tag => 'main_process').each do |job|
     Rufus::Scheduler.singleton.unschedule(job)
    end
    puts 'Starting rufus'
    load "#{Rails.root}/config/initializers/scheduler.rb"
  end
  end



