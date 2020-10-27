class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
		t.float :total
		t.datetime :order_date
		t.boolean :paid, default: false
		t.boolean :order_made, default: false
		t.string :guest_name
		t.string :guest_number
		t.string :guest_email
		t.boolean :call_pref, default: false
		t.boolean :text_pref, default: false
		t.integer :day_id
		t.string :pickupTime
		t.text :pickup_notes

      t.timestamps
    end
  end
end
