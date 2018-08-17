class AddTotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total, :float
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
