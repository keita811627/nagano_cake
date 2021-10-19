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
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete'
  resources :orders
  
  resources :cart_items
  delete 'cart_items/destroy_all'
  get 'unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw'
  resource :customers
 
  resources :items

  get 'homes/about'
  end
  ##publicのhomesページをルートパス/に設定
  root to: 'public/homes#top'
  devise_for :admins
  devise_for :customers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
