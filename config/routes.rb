Rails.application.routes.draw do
  root 'recipes#index'
  get '/login', to: 'session#new', as: 'login'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  post '/signin', to: 'session#create', as: 'signin'
  get '/signout/', to: 'session#destroy'
  
  resources :user_ingredients
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  resources :reviews
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
