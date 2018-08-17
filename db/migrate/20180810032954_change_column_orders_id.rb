class ChangeColumnOrdersId < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_details, :orders_id
    add_column :order_details, :order_id, :integer
  end
end
