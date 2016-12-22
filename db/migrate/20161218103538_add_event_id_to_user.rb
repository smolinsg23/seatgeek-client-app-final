class AddEventIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :event_id, :integer
   
  end
end
