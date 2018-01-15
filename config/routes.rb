Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'matomes#index'
  resources :articles, only: %i(new create show edit update destroy) do
    collection do
      get :search
    end
  end
  resources :matomes, only: %i(index show) do
    collection do
      get :tags
    end
  end
end
