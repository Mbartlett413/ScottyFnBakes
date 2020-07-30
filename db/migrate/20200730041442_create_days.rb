class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
		t.integer :order_limit, default: 16
		t.integer :openings, default: 16
		t.datetime :this_date
		t.integer :todays_order, array: true
		t.boolean :closed, default: false
      t.timestamps
    end
  end
end
