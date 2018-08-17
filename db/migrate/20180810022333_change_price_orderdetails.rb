class ChangePriceOrderdetails < ActiveRecord::Migration[5.1]
  def change
    change_column :order_details, :price, :float
    # Ex:- change_column("admin_users", "email", :string, :limit =>25)
    remove_column :order_details, :float
  end
end
