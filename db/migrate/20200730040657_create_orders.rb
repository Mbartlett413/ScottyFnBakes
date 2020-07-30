class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
		t.float :total
		t.json :order_details
		t.datetime :order_date
		t.boolean :paid, default: false
		t.boolean :order_made, default: false
		t.integer :user_id
		t.integer :day_id
      t.timestamps
    end
  end
end
