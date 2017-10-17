Rails.application.routes.draw do
root 'welcome#index'
get '/welcome', to: 'welcome#index'
  get '/posts', to: 'posts#all'
get '/about', to: 'welcome#show'

resources :posts


  resources :places do
    collection do
      put :get_locations
      put :get_stores
    end
end
resources :categories, only: [:index, :show]
  devise_for :users

  resources :users do
resources :posts, only: [:index, :create, :new]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

