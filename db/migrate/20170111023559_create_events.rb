class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :sg_id
      t.integer :lowest_price
      t.string :name
      t.string :image
      t.string :data_time
      t.string :venue

     

      t.timestamps
    end
  end
end
