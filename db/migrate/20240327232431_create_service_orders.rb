class CreateServiceOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_orders do |t|
      t.references :client, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.integer :mileage
      t.datetime :entry_time
      t.datetime :exit_time
      t.date :entry_date
      t.date :exit_date
      t.text :description

      t.timestamps
    end
  end
end
