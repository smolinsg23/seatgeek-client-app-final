class ChangeLowestPriceInBidsToString < ActiveRecord::Migration[5.0]
  def change
     change_column :bids, :lowest_price, :string

  end
end
