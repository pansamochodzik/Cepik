# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations'}
  resources :users

  resources :cars, except: :destroy do
    get :home, on: :member
  end

  resources :mileages, only: [:new, :create]

  root 'cars#home'
end
