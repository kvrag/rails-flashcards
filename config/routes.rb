Rails.application.routes.draw do

  get '/' => 'pages#index'
  get '/sessions/new' => 'sessions#new', as: "new_session"
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  get '/session_helper' => 'pages#session_helper'

  resources :users
end
