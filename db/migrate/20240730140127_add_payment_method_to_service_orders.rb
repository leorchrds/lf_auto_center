class AddPaymentMethodToServiceOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :service_orders, :payment_method, :string
  end
end
