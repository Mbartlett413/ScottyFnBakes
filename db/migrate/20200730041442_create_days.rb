class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
		t.integer :max_orders, default: 16
		t.integer :avaliable_spots, default: 16
		t.datetime :this_date
		t.boolean :closed, default: false
      t.timestamps
    end
  end
end
