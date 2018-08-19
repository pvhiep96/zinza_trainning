require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { FactoryBot.create(:user, admin: true) }
  let(:order) { FactoryBot.create(:order, user: user) }
  let(:category) { FactoryBot.create(:category, user: user) }
  let!(:product) { FactoryBot.create(:product, category: category, user: user) }
  describe 'test product' do
    before do
      user.confirm
      sign_in user
    end
    it 'render product index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'render product show' do
      get :show, params: { id: product.id }
      expect(response).to render_template(:show)
    end

    it 'render product create' do
      post :create, params: { product: { name: 'Product', quantity: 1, category_id: category.id, price: 100 } }
      expect(response).to redirect_to(products_path)
    end

    it 'render product update' do
      put :update, params:
      { product: { name: 'Productsddsdsds', quantity: 1, category_id: category.id, price: 100 }, id: product.id }
      expect(response).to redirect_to(product_path(product))
    end

    it 'render product destroy' do
      delete :destroy, params: { id: product.id }
      expect(response).to redirect_to(products_path)
    end

    it 'create order_id' do
      get :index
      expect(session['order_id']).to eq(Order.last.id)

    end
  end
end
