Rails.application.routes.draw do

  get '/' => 'pages#index'

  resources :users
end
