class AddNameToOrderdetail < ActiveRecord::Migration[5.1]
  def change
    add_column :order_details, :name, :string
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
