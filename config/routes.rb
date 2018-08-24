Rails.application.routes.draw do
  scope '(:locale)', locale: /en|vi/ do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    resources :orders
    post 'orders/checkout/:id' => 'orders#checkout', as: :order_checkout
    post 'orders/update_quantity/:id' => 'order_details#update_quantity', as: :quantity
    get 'orders/detail/:id' => 'orders#detail', as: :detail
    get 'products/showall' => 'products#showall'
    # resources :line_items, only: [:create, :update, :destroy]
    # resources :cart, only: [:show]
    resources :order_details
    root to: 'products#index'
    resources :products
    resources :pictures
    resources :categories
    devise_for :users, skip: :omniauth_callbacks
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
