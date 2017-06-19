class CreateWalls < ActiveRecord::Migration[5.0]
  def change
    create_table :walls do |t|
      t.string :name
      t.string :category
      t.integer :height
      t.integer :width
      t.integer :depth
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
