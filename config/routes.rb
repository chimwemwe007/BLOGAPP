Rails.application.routes.draw do
<<<<<<< HEAD
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
   end

   root 'users#index'
end
=======
  root to: "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa
