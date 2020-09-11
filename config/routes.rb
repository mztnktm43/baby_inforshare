Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"
<<<<<<< Updated upstream
  resources :items
  resources :users, only: :show
=======
  resources :items do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update, :destroy]
>>>>>>> Stashed changes
end
