Rails.application.routes.draw do
  namespace :admin do
    resources :order_datails
 
    resources :orders
  
  
    resources :customers
  
  
    resources :genres
  
  
    resources :items
  
  
    get '/' => 'homes#top'
  end

  namespace :public do

  resources :addresses

  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete'
  resources :orders

  resources :cart_items
  delete 'cart_items' => 'cart_items#destroy_all'


  get 'unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw'
  resource :customers

  resources :items

  get 'homes/about'

  end
  ##publicのhomesページをルートパス/に設定
  root to: 'public/homes#top'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
