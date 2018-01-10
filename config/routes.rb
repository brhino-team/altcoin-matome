Rails.application.routes.draw do
  devise_for :users
  root 'matomes#index'
  resources :articles, only: %i(new create show)
end
