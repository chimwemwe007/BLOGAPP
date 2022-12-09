Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  get 'posts/index'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root 'users#index'
  # Defines the route for the users index page ("/users")
  resources :users, only: [:index, :show] do
    # Defines the route for the posts index page ("/users/:user_id/posts")
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create]
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
   end

   root 'users#index'
end
>>>>>>> e9c2032195cbf0c98c447a9f4d718028676a1f3f
=======
  root to: "users#index"

  resources :users, only: [:show] do
    resources :posts, only: [:new, :create, :index, :show] do
      resources :comments, only: [:new, :create]
>>>>>>> 289918409f164a7f36a95e0ae462e6cefa02984f
      resources :likes, only: [:create]
    end
  end
end
<<<<<<< HEAD
=======
>>>>>>> a84e878566ac4c3820d02ce9889d3f621b67f9fa
>>>>>>> e9c2032195cbf0c98c447a9f4d718028676a1f3f
