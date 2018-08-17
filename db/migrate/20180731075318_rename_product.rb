class RenameProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :users_id, :integer
    remove_column :products, :categories_id, :integer
    add_column :products, :user_id, :integer
    add_column :products, :category_id, :integer
  end
end
