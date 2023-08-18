# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employees
  resources :tasks
  resources :projects
  resources :sessions, only: %i[new create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'sessions#new'
end
