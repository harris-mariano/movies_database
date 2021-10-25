# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movies
  devise_for :users

  root 'movies#index', as: 'root'
end
