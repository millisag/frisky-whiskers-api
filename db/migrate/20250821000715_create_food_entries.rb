class CreateFoodEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :food_entries do |t|
      t.string :name
      t.integer :calories
      t.references :cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
