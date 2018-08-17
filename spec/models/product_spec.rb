require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user) }
  let!(:product) { FactoryBot.create(:product, category: category, user: user, name: 'Uniq name') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(product).to be_valid
    end

    it 'is valid with valid name' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'is valid with valid price' do
      product.price = nil
      expect(product).to_not be_valid
    end

    it 'is valid with valid category_id' do
      product.category_id = nil
      expect(product).to_not be_valid
    end

    context 'should validate name uniqueness' do
      let(:product1) { FactoryBot.build(:product, category: category, user: user, name: 'Uniq name') }
      it do
        product1.valid?
        expect(product1.errors.full_messages).to include 'Name has already been taken'
      end
    end
  end
end
