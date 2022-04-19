Rails.application.routes.draw do
  root 'users#index'
  resources :books do
    resources :comments
  end
  get 'signup' => 'users#new'
  resources :users
  resources :authors
  namespace :admin do
    resources :publishers
  end
end
