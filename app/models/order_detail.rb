
class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, presence: true
  validates :price, presence: true


  def self.to_csv
    attributes = %w{name quantity price}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |order_detail|
        csv << attributes.map{ |attr| order_detail.send(attr) }
      end
    end
  end
end
