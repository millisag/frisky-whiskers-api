class CreateCats < ActiveRecord::Migration[8.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.string :breed
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
