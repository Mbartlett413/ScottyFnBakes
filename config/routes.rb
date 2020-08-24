Rails.application.routes.draw do
  resources :categories
  resources :days
  resources :orders
  resources :loafs
  devise_for :users
  resources :user, only: [:edit, :update] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  get 'admin_page', to: 'landing_page#admin_page'
end
