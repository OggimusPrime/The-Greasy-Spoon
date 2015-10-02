Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :restaurants
  get 'main/about'

  get 'main/contact'

  root 'restaurants#index'
end
