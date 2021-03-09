class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.string  :name,              null: false
      t.string  :gender,            null: false
      t.integer :age,               null: false
      t.text    :advantage,         null: false
      t.string  :position,          null: false
      t.text    :appeal,            null: false

      t.timestamps
    end
  end
end
