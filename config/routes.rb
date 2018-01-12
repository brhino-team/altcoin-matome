Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'matomes#index'
  resources :articles, only: %i(new create show edit update destroy) do
    member do
      get :destroy_confirmation
    end
  end
  resources :matomes, only: %i(index) do
    collection do
      get :maincoin
      get :altcoin
      get :market
      get :mining
      get :ico
      get :others
    end
  end
end
