class AddReferencesProductToOrderdetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_details, :product, foreign_key: true
  end
end
