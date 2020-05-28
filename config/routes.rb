Rails.application.routes.draw do

  get 'bookeepings/index'
  #get '/sessions/new'
  resources :sessions
  resources :customers
  resources :users 
  resources :orders 
  resources :suppliers 
  resources :products 

  root "sessions#new"

  get '/products/:id/orders', to: 'products#orders_list'
  get '/customers/:id/orders', to: 'customers#orders_list'
  get 'home', to: 'users#welcome'
  get '/bookkeeping', to: 'users#bookkeeping'
  get '/account', to: 'users#account'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/register', to: "users#new"
  post '/register', to: "users#create"
 # get 'home', to: 'users#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end 