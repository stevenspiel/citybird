CityBird::Application.routes.draw do
  root to: 'landing_page#index'

  match '/users/toggle_ambassador', to: 'users#ambassador_toggle', via: [:put]
  match '/users/toggle_ambassador_availability', to: 'users#ambassador_availability_toggle', via: [:put]
  match '/contact_ambassador', to: 'emails#new_request', via: [:post]
  match '/reject_request', to: 'emails#reject', via: [:post]
  match '/reply', to: 'emails#reply', via: [:post]

  resources :users, only: [:edit, :update, :show] do
    resources :meetups, only: [:index, :show, :edit, :update, :create]
    resources :reviews, only: [:index, :new, :create]
    resources :tours
  end

  get '/dashboard', to: 'users#dashboard'
  match '/search', to: 'users#search', via: [:get]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get '/be_an_ambassador', to: 'marketing#index'
  get '/thanks', to: 'marketing#thanks'

  match '/update_profile_pic/:user_id', to: 'users#update_profile_pic', via: [:patch]
end
