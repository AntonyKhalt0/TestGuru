# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index  do
      resources :answers, shallow: true, except: :index
    end
  end

  resource :test_passages, only: %i[ show update ] do
    member do
      get :result
    end
  end
end
