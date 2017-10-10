Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get '/posts', to: 'posts#all'
  resources :users do
resources :posts, only: [:index]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts
end
