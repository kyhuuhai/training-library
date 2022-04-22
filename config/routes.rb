Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  namespace :admin do
    get 'users/show'
    get 'users/add'
    delete 'users/destroy'
    resources :users
  end
  get 'index' => 'users#index'
  resources :authors
end
