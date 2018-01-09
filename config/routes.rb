Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: ENV["sign_up_path"] }
  root 'matomes#index'
end
