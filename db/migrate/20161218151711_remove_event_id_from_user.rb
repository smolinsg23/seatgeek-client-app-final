class RemoveEventIdFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :event_id, :integer
  end
end
