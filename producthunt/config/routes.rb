Rails.application.routes.draw do

  root 'posts#index'

  get 'comments/new'
  get 'users/new'

  get 'sessions/new'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'

  #facebook login routes
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'logout', to: 'sessions#destroy'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  #origin login routes
  # post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
    resources :feedbacks do
      resources :comments do
        member do
          put "like", to: "comments#upvote"
          put "dislike", to: "comments#downvote"
        end
      end
    end
  end
end
