Rails.application.routes.draw do
  resources :users
  namespace :intake do
    resources :profiles, only: %i[new create]
    resources :accounts, only: %i[new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
