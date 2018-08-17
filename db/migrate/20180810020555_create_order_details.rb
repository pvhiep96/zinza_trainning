class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.string :price
      t.string :float
      t.integer :quantity
      t.references :orders, foreign_key: true
      t.timestamps
    end
  end
end
