Rails.application.routes.draw do
  get 'pictures/create'
  #get 'events/index'
  devise_for :users

  resources :users, only: [:show]
  resources :events do 
    resources :pictures, only: [:create] 
  end
  
  resources :charges
  resources :attendances, only: [:new, :create]
  root 'events#index'
  #get 'static_page/index'
  get 'static_page/secret'

  namespace :admin do
    devise_for :users
    root 'admin#index'
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
