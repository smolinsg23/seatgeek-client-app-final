class RenmameSavedBidToMatchedPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :bids, :saved_bid, :matched_price
  end
end
