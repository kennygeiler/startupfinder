Rails.application.routes.draw do

  get 'comments/new'

  get 'users/new'
  root 'posts#index'
  get 'sessions/new'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'

  #facebook login routes
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

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
