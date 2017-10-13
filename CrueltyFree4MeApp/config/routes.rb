Rails.application.routes.draw do
root 'welcome#index'
  get '/posts', to: 'posts#all'

  resources :places do
    collection do
      put :get_locations
    end
end
resources :categories, only: [:index, :show]
  devise_for :users

  resources :users do
resources :posts, only: [:index]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts
end

