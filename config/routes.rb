Rails.application.routes.draw do
  get 'shops/index'
  resources :products


  root 'shops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
