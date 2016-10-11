Rails.application.routes.draw do
  resources :places
  resources :genres
  resources :lyrics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root 'about#home'

  get 'code', to: redirect('/software')
  get 'interests' => 'interests#index'

  get 'about/home' => 'about#home'
  get 'about' => 'about#about'

  resources :accounts
  resources :awards
  resources :addresses
  resources :artists
  resources :companies
  resources :emails
  resources :notes
  resources :parties
  resources :phones
  resources :roles
  resources :series
  resources :series_works
  resources :titles
  resources :tools
  resources :wields
  resources :works


  devise_for :users
  get 'status' => 'admin#status', as: 'status'
  get 'todd-gehman-resume' => 'resume#show', as: :resume
  match 'settings' => 'users#edit', via: [:get, :patch], as: :settings

  get 'artists/:slug' => 'parties#show'

  resources :interests, path: '/'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


end
