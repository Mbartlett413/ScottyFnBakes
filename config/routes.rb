Rails.application.routes.draw do
  resources :categories, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :days, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :loafs, only: [:new, :create, :show, :edit, :update, :destroy]
  devise_for :users
  resources :user, only: [:edit, :update] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  get 'admin_page', to: 'landing_page#admin_page'
end
