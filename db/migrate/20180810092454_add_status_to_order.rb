class AddStatusToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :status, :integer, default: 1
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
