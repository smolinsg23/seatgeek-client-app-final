class AddSavedBidToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :saved_bid, :integer
  end
end
