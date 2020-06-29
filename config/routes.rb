# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cars/home', to: 'cars#home'
  resources :cars

  root 'cars#home'
end
