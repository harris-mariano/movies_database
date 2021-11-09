# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :movies
    resources :reviews
    resources :users
    resources :favorites
    resources :actors
    resources :casts

    root to: 'movies#index'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[show]

  resources :movies, only: %i[index show] do
    resources :reviews, except: %i[index new show]
    post :add_to_favorites
    delete :remove_from_favorites
  end

  resources :actors, only: %i[show]

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show]
    end
  end

  root 'home#index', as: 'root'
end
