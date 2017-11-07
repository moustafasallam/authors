Rails.application.routes.draw do
  resources :books
  resources :authors
  devise_for :users

  namespace :api, defaults: {format: :json} do
   	namespace :v1 do
      resources :books, only: [:index]
      resources :authors, only: [:create]
    end
  end

	root to: "books#index"
end
