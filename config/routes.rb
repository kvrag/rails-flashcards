Rails.application.routes.draw do

  get '/' => 'pages#index'
  get '/sessions/new' => 'sessions#new', as: "new_session"
  post '/sessions' => 'sessions#create'

  resources :users
end
