class ChangeUseridToIntegerInCategories < ActiveRecord::Migration[5.1]
  def change
    change_column :categories, :user_id, :integer
  end
end
