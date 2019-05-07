Rails.application.routes.draw do
  #get 'events/index'
  devise_for :users

  resources :users, only: [:show]
  resources :events
  root 'events#index'
  #get 'static_page/index'
  get 'static_page/secret'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
