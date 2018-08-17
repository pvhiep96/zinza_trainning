class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  enum status: %i[checkout not_checkout]

  def order_empty?
    order_details.empty?
  end

  def total_price
    order_details.to_a.sum { |item| item.price * item.quantity }
  end
end
