class Api::V1::UsersController < ApplicationController
  def show
     @bidds = Bid.where(user_id: current_user.id)
    render 'show.json.jbuilder'
end
end
