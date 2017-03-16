class RemoveExpiredFromBids < ActiveRecord::Migration[5.0]
  def change
    remove_column :bids, :expired
  end
end
