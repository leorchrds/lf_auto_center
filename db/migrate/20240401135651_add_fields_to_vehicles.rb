class AddFieldsToVehicles < ActiveRecord::Migration[5.2]
  
  def change
    add_column :vehicles, :gear, :string
    add_column :vehicles, :engine_size, :decimal, precision: 10, scale: 2
    add_column :vehicles, :year_model, :integer
    add_column :vehicles, :avg_price_brl, :decimal, precision: 10, scale: 2
  end
end
