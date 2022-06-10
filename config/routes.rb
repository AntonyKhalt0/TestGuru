# frozen_string_literal: true

Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :badges, only: :index

  resources :feedbacks, only: %i[new create], shallow: true
  
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end

    resources :gists, only: :create
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :badges, only: %i[index show new create edit update destroy]
    resources :gists, only: :index
  end
end
