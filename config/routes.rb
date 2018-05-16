Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  devise_for :users
  root to: 'campaigns#index'

  resources :campaigns do
    resources :todos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
