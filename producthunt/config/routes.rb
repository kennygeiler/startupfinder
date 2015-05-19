Rails.application.routes.draw do

  get 'comments/new'

  get 'users/new'
  root 'posts#index'
  get 'sessions/new'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :posts do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :feedbacks do
      member do
        put "like", to: "links#upvote"
        put "dislike", to: "links#downvote"
      end
      resources :comments
    end
  end
end
