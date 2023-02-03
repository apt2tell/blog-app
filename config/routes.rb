Rails.application.routes.draw do
  devise_for :users
    root "users#index"
    
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show, :destroy] do
       resources :comments, only: [:create, :destroy]
        resources :likes, only: [:create]
    end

    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :show]
      end
    end
  end
end