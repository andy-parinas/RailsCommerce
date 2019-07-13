Rails.application.routes.draw do

  # get 'reports/index'
  # get 'reports/show'
  # get 'customers/index'
  # get 'customers/show'
  # get 'order_items/create'
  get 'shops/index'


  resources :products

  resources :orders

  delete "/orders/:id", to: "orders#cancel"

  resources :order_items

  resources :customers

  resources :reports

  root 'shops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
