# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answers, only: [ :create, :destroy, :show, :edit, :update ]
  end
  root to: "questions#index"
end
