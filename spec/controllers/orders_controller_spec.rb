require 'rails_helper'
RSpec.describe OrdersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:order) { FactoryBot.create(:order, user: user) }

  describe 'test category' do
    before do
      user.confirm
      sign_in user
    end
    it 'render order index' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'render order show' do
      get :show, params: { id: order.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'test #checkout' do
    before do
      user.confirm
      sign_in user
    end
    context 'success' do
      it do
        post :checkout, params: { order: { user_id: user.id, total: order.total, status: 'checkout' }, id: order.id }
        expect(response).to redirect_to(products_path)
      end
    end
  end

  describe 'test #destroy' do
    before do
      user.confirm
      sign_in user
    end
    it do
      delete :destroy, params: { id: order.id }
      expect(response).to redirect_to(products_path)
    end
  end
end
