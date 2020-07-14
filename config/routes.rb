# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations'}
  resources :users

  get 'cars/home', to: 'cars#home'
  resources :cars

  root 'cars#home'
end
