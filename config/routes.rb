Rails.application.routes.draw do

  resources :customers
  resources :users 
  resources :orders 
  resources :suppliers 
  resources :products 

  get '/customers/:id/orders', to: 'customers#orders_list'
  get 'home', to: 'users#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
