Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"

  resources :items do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy]

end
