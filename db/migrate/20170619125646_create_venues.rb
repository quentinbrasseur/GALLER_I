class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :title
      t.string :category
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
