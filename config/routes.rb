# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, only: [:new, :create]
  end
  resources :questions, only: [:show, :edit, :update, :destroy]
end
