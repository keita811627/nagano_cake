Rails.application.routes.draw do
  namespace :admin do
    resources :order_datails
  end
  namespace :admin do
    resources :orders
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    get '/' => 'homes#top'
  end
  namespace :public do
  resources :addresses
  end
  namespace :public do
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete'
  resources :orders

  end
  namespace :public do
  resources :cart_items
  delete 'cart_items/destroy_all'

  end
  namespace :public do
  get 'unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw'
  resources :customers
  end
  namespace :public do
  resources :items
  end
  namespace :public do
  get 'homes/about'
  end
  ##publicのhomesページをルートパス/に設定
  root to: 'public/homes#top'
  devise_for :admins
  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
