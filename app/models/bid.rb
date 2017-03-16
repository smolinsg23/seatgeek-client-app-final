class Bid < ApplicationRecord
  belongs_to :user
  has_many :buy_now_bids
  scope :not_matched, -> {where("matched_price IS NULL")}
 end 
  
 



