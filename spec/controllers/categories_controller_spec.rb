require 'rails_helper'
RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user, admin: true) }
  let(:category) { FactoryBot.create(:category, user: user) }

  describe 'test category' do
    before do
      user.confirm
      sign_in user
    end

    it 'render categories index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'render categories show' do
      get :show, params: { id: category.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'test #create' do
    before do
      user.confirm
      sign_in user
    end
    context 'success' do
      it do
        post :create, params: { category: { name: 'nbnbcnvs' } }
        expect(Category.count).to eq(+ 1)
        expect(response).to redirect_to Category.last
      end
    end

    context 'fail' do
      it do
        post :create, params: { category: { id: 2, name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'test #update' do
    before do
      user.confirm
      sign_in user
    end

    context 'success' do
      it do
        put :update, params: { category: { name: 'nmnmrrvncmvne34c' }, id: category.id }
        expect(response).to redirect_to(category_path(category))
      end
    end
    context 'fail' do
      it do
        put :update, params: { category: { name: nil }, id: category.id }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'test #destroy' do
    before do
      user.confirm
      sign_in user
    end
    it do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_path)
    end
  end
end
