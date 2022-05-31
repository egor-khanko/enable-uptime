# frozen_string_literal: true

Rails.application.routes.draw do
  mount API::Root => '/'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Rswag::Ui::Engine => '/api/docs'
end
