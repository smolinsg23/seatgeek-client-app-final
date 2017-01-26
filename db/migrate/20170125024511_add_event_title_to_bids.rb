class AddEventTitleToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :event_title, :string
  end
end
