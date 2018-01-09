Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: Rails.application.secrets.sign_up_path }
  root 'matomes#index'
end
