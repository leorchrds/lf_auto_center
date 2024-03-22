class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :license_plate, null: false
      t.string :brand, null: false
      t.string :model, null: false
      t.references :client, null: false, foreign_key: true
      t.string :color, null: false
      t.integer :year_of_manufacture
      t.string :fuel_type

      t.timestamps
    end
  end
end
