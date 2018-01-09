Rails.application.routes.draw do
  devise_for :users
  root 'matomes#index'
end
