class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
