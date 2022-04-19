Rails.application.routes.draw do
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  resources :users
  namespace :admin do
    resources :categories
  resources :authors
  namespace :admin do
<<<<<<< HEAD
    resources :publishers
=======
>>>>>>> c2e8d46 (update manage author)
    resources :authors
  end
end
