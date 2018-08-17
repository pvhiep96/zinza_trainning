require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user, email: 'abc@gmail.com') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    context 'should validate email uniqueness' do
      let(:user1) { FactoryBot.build(:user, email: 'abc@gmail.com') }
      it do
        user1.valid?
        expect(user1.errors.full_messages).to include 'Email has already been taken'
      end
    end
  end
end
