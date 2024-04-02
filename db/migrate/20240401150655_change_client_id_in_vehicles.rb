class ChangeClientIdInVehicles < ActiveRecord::Migration[5.2]
  def change
    change_column :vehicles, :client_id, :bigint, null: true
  end
end

