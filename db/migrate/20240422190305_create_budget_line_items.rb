class CreateBudgetLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_line_items do |t|
      t.references :budget, foreign_key: true
      t.string :service_name
      t.integer :quantity
      t.decimal :unit_price

      t.timestamps
    end
  end
end
