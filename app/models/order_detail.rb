class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, presence: true
  validates :price, presence: true
end
