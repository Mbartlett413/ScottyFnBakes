class CreateDaysOfWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :days_of_weeks do |t|
      t.string :title
      t.boolean :open

      t.timestamps
    end
  end
end
