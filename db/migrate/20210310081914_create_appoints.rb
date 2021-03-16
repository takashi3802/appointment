class CreateAppoints < ActiveRecord::Migration[6.0]
  def change
    create_table :appoints do |t|
      t.integer :time_select_id     , null: false
      t.datetime :start_time, null: false
      t.references :user               , null: false, foreign_key: true
      t.references :staff               , null: false, foreign_key: true
     
      t.timestamps
    end
  end
end
