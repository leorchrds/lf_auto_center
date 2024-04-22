class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.references :client, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
