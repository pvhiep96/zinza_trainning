class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :product, foreign_key: true

      t.timestamps
    end
    # add_index :pictures, [:product_id]
  end
end
