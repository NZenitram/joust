Rails.application.routes.draw do

  root to: 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  post '/', to: 'home#create'

  post 'remove', to: 'home#remove'

  namespace :api do
    namespace :v1 do
      resources :comments, only: [:create]
    end
  end
end
