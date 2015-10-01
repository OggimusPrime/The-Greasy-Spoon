Rails.application.routes.draw do
  devise_for :users
  resources :restaurants
  get 'main/about'

  get 'main/contact'

  root 'restaurants#index'
end
