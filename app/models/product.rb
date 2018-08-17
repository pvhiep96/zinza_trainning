class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :pictures, dependent: :destroy
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :order_details, reject_if: :all_blank, allow_destroy: true
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category_id, presence: true

  def self.order_list(sort_order)
    if sort_order == 'newest' || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == 'name'
      order(name: :asc)
    elsif sort_order == 'price'
      order(price: :desc)
    elsif sort_order == 'quantity'
      order(quantity: :desc)
    else
      order(created_at: :asc)
    end
  end
end
