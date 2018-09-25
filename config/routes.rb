# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ideas do
    resources :reviews, shallow: true, only: %i[create destroy edit update]
  end

  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :destroy, :create]

  get '/' => 'ideas#index'
end
