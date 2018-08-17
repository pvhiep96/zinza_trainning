require 'rails_helper'
RSpec.describe OrderDetailsController, type: :controller do
  let(:user) { FactoryBot.create(:user, admin: true) }
  let(:category) { FactoryBot.create(:category, user: user) }
  let(:order) { FactoryBot.create(:order, user: user) }
  let(:product) { FactoryBot.create(:product, category: category, user: user) }
  let(:order_detail) { FactoryBot.create(:order_detail, product: product, order: order) }

  describe 'test category' do
    before do
      user.confirm
      sign_in user
    end

    it 'render order_detail index' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'test #destroy' do
    before do
      user.confirm
      sign_in user
    end
    it do
      delete :destroy, params: { id: order_detail.id }
      expect(response).to redirect_to(order_path(Order.last))
    end
  end
end
