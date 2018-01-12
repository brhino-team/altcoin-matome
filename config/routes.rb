Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'matomes#index'
  resources :articles, only: %i(new create show edit update destroy)
  resources :matomes, only: %i(index show)
end
