Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    resources :reviews, except: [:show, :index]
  end
  
  get 'main/about'

  get 'main/contact'

  root 'restaurants#index'
end
