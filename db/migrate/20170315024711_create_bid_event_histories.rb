class CreateBidEventHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :bid_event_histories do |t|
      t.belongs_to :bid_event
      t.decimal :lowest_price, precision: 5, scale: 2, null: false

      t.timestamps
    end
  end
end
