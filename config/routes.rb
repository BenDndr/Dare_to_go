Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :categorys, only: :index
  resources :challenges, only: [:index, :show, :new, :create, :edit, :update] do
    resources :dares, only: [:index, :new, :create, :edit, :update, :show] do
      resources :messages, only: [:index, :new, :create, :edit, :update]
      resources :journeys, only: [:new, :create, :edit, :update]
    end
  end
  resources :journeys, only: [:index]
  namespace :my do
    resources :journeys, only: [:index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
