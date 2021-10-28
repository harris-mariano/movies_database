# frozen_string_literal: true

Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  resources :actors do
    post :create_cast
  end

  resources :movies do
    resources :reviews
    post :create_cast
    post :add_to_favorites
  end

  root 'home#index', as: 'root'
end
