Rails.application.routes.draw do

  get 'order_items/create'
  get 'shops/index'


  resources :products

  resources :orders

  resources :order_items

  root 'shops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
