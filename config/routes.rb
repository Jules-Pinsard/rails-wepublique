Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "category" => "pages#category"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :mesures, only: %i[index show new create update destroy] do
    resources :comments, only: %i[create]
  end

  resources :comments, only: %i[destroy] do
    member do
      patch "upvote"
      patch "downvote"
    end
    resources :sub_comments, only: %i[create]
  end

  resources :mesures, only: [] do
    member do
      patch "upvote"
    end
  end

  resources :sub_comments, only: %i[destroy] do
    member do
      patch "upvote"
      patch "downvote"
    end
  end
  resources :chatrooms , only: [] do
    resources :messages, only: :create
  end
  resources :observations, only: %i[index new create]

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
end
