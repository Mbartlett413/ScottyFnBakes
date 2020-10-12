class CreateLoafs < ActiveRecord::Migration[5.2]
  def change
    create_table :loafs do |t|
   		t.string :name
      	t.string :ingredients
      	t.boolean :active_item
      	t.integer :price
        t.integer :category_id
        t.integer :user_id
      t.timestamps
    end
  end
end
