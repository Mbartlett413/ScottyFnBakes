class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
    	t.boolean :active 
    	t.string :name
    	t.integer :price
      t.timestamps
    end
  end
end
