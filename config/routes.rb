# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, except: %i[create update] do
    collection do
      post 'create_user' => 'users#create', as: :create_user
    end

    member do
      patch 'update_user' => 'users#update', as: :update_user
    end
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
