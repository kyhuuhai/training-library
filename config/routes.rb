Rails.application.routes.draw do
  root 'users#index'
  resources :publishers
  resources :books
  get 'signup' => 'users#new'
  resources :users
  namespace :admin do
    resources :categories
  end
end
