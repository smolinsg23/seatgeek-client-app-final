class AddExpirationDateToBidEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :bid_events, :expiration_date, :datetime, null: false
  end
end
