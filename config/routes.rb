# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root 'diaries#index'
  resources :diaries do
    resources :comments,only: [:new, :create]
  end
  resources :users
  resources :tasks,except: :show
end
