Rails.application.routes.draw do
  devise_for :users

  root 'gadgets#index'

  resources :gadgets
end
