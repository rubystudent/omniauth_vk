Rails.application.routes.draw do
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('login')
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: :show
end
