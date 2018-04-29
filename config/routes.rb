Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: :show
  root 'tasks#index'
end
