class CreateBuyNowBids < ActiveRecord::Migration[5.0]
  def change
    create_table :buy_now_bids do |t|
      t.integer :bid_id
      t.integer :lowest_price
      t.integer :average_price

      t.timestamps
    end
  end
end
