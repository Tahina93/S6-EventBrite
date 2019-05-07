Rails.application.routes.draw do
  get 'events/index'
  get 'static_page/index'
  get 'static_page/secret'
  devise_for :users
  root 'events#index'

  resource :users
  resource :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
