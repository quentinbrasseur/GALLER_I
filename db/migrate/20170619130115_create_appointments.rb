class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :start_date
      t.date :end_date
      t.references :artwork, foreign_key: true
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
