Rails.application.routes.draw do
  resources :orders
  post 'orders/checkout/:id' => 'orders#checkout', as: :order_checkout
  post 'orders/update_quantity/:id' => 'order_details#update_quantity', as: :quantity
  get 'orders/detail/:id' => 'orders#detail', as: :detail
  # resources :line_items, only: [:create, :update, :destroy]
  # resources :cart, only: [:show]
  resources :order_details
  root to: 'products#index'
  resources :products
  resources :pictures
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
