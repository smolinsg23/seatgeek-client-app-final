class CreateBidEvent < ActiveRecord::Migration[5.0]
  def change
    create_table :bid_events do |t|
      t.string :event_id, unique: true
    end
  end
end
