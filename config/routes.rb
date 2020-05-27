Rails.application.routes.draw do

  resources :customers
  resources :users 
  resources :orders 
  resources :suppliers 
  resources :products 

  get '/products/:id/orders', to: 'products#orders_list'
  get '/customers/:id/orders', to: 'customers#orders_list'
  get 'home', to: 'users#welcome'
  get '/bookkeeping', to: 'users#bookkeeping'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
