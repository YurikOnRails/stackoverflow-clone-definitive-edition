# frozen_string_literal: true

Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: :create
  end
end
