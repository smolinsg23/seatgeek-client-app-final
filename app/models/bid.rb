class Bid < ApplicationRecord
  belongs_to :user
  has_many :buy_now_bids
end
