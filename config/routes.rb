Rails.application.routes.draw do
  resources :reviews, except: [:show, :index]
  devise_for :users
  resources :restaurants
  get 'main/about'

  get 'main/contact'

  root 'restaurants#index'
end
