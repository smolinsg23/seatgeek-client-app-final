class AddExpiredToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :expired, :boolean, default: false, null: false
  end
end
