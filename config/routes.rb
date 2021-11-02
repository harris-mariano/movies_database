# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users do
    delete :remove_from_favorites, param: :movie_id
  end

  resources :actors do
    post :create_cast
  end

  resources :movies do
    resources :reviews
    post :create_cast
    post :add_to_favorites
    delete :remove_from_favorites
  end

  root 'home#index', as: 'root'
end
