class CreateOrderCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :order_collections do |t|
    	t.integer :order_id
		t.integer :quantity
		t.integer :day_id
		t.integer :loaf_id
      t.timestamps
    end
  end
end
