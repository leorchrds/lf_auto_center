class ChangeVehicleFieldsNullability < ActiveRecord::Migration[5.2]
  def change
    change_column_null :vehicles, :color, true
    change_column_null :vehicles, :brand, true
    change_column_null :vehicles, :model, true
    change_column_null :vehicles, :license_plate, true
    change_column_null :vehicles, :fuel_type, true
    # Adicione mais alterações de coluna para outros campos, se necessário
  end
end
