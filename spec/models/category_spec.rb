require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, user: user, name: 'abc') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'is valid with valid name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    context 'is uniquess name' do
      let(:category1) { FactoryBot.build(:category, user: user, name: 'abc') }
      it do
        category1.valid?
        expect(category1.errors.full_messages).to include 'Name has already been taken'
      end
    end
  end
end
