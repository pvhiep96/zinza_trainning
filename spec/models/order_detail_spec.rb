require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user) }
  let(:product) { FactoryBot.create(:product, category: category, user: user) }
  let(:order) { FactoryBot.create(:order, user: user) }
  let(:order_detail) { FactoryBot.create(:order_detail, order: order, product: product) }
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(order_detail).to be_valid
    end

    # it { should belong_to(:order) }
    it 'is not valid without a quantity' do
      order_detail.quantity = nil
      expect(order_detail).to_not be_valid
    end

    it 'is not valid without a price' do
      order_detail.quantity = -1
      expect(order_detail).to_not be_valid
    end
  end
end
