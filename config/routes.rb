# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'diaries#index'
  resources :diaries do
    resources :comments, only: %i[new create]
    resources :bookmarks, only: %i[create destroy]
    collection do
      get :bookmarks
    end
  end
  resources :users
  resources :tasks, except: :show
  resources :infomations

  resources :questions, except: %i[update edit] do
    resources :answers, only: %i[new create]
  end

  get '/atunou', to: 'diaries#atunou_index'

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
