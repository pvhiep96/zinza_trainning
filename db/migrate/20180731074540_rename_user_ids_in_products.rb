class RenameUserIdsInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :users_id, :user_id
    rename_column :products, :categories_id, :category_id
  end
end
