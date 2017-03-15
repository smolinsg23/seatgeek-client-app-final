class AddCurrentBuyNowPriceToBidEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :bid_events, :current_buy_now_price, :decimal, precision: 5, scale: 2, null: false
  end
end
