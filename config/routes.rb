Rails.application.routes.draw do
  resources :user_ingredients
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
