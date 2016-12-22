class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :bid
      t.integer :lowest_price

      t.timestamps
    end
  end
end
