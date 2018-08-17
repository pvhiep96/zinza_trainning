class Category < ApplicationRecord
  belongs_to :user
  has_many :product, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
