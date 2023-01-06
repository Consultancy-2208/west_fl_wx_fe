Rails.application.routes.draw do
  get "/", to: 'pages#welcome'
  get '/auth/:provider/callback', to: 'sessions#new'
  resources :users, only: [:new, :create, :show]
end
