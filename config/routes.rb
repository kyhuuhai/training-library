Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'users#index'
  get 'signup' => 'users#new'
  get 'author' => 'authors#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'index_category' => 'categories#index'
  resources :users
  namespace :admin do
    resources :categories
  resources :authors
  resources :books
  resources :categories
  namespace :admin do
    resources :publishers
    resources :authors
    resources :categories
    resources :books
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
