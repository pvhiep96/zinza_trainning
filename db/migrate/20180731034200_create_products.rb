class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.boolean :status
      t.references :users, foreign_key: true
      t.references :categories, foreign_key: true

      t.timestamps
    end
    add_index :products, %i[user_id category_id]
  end
end
