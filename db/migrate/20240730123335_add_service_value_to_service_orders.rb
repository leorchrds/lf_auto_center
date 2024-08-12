class AddServiceValueToServiceOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :service_orders, :service_value, :decimal
  end
end
