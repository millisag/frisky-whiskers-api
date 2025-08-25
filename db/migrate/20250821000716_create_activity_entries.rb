class CreateActivityEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :activity_entries do |t|
      t.string :activity_type
      t.integer :duration
      t.integer :calories_burned
      t.references :cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
