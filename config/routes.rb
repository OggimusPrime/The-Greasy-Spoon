Rails.application.routes.draw do
  resources :restaurants
  get 'main/about'

  get 'main/contact'

  root 'restaurants#index'
end
