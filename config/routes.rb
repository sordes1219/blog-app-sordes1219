# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resource :timeline, only: %i[show]

  resources :articles do
    resources :comments, only: %i[new create]
    resource :like, only: %i[create destroy show]
  end

  resources :accounts, only: %i[show] do
    resources :follows, only: %i[create]
    resources :unfollows, only: %i[create]
  end

  resource :profile, only: %i[show edit update]
  resources :favorites, only: %i[index]
end
