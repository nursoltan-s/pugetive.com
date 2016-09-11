Rails.application.routes.draw do
  resources :series_works
  resources :series
  resources :works
  resources :awards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root 'about#home'

  get 'interests' => "interests#index"

  get 'code', to: redirect('/software')

  resources :accounts
  resources :addresses
  resources :artists
  resources :companies
  resources :emails
  resources :notes
  resources :parties
  resources :phones
  resources :projects
  resources :roles
  resources :titles
  resources :tools
  resources :wields


  devise_for :users
  get 'about/home'
  get 'status' => 'admin#status', as: 'status'
  get 'todd-gehman-resume' => 'resume#show', as: :resume
  match 'settings' => 'users#edit', via: [:get, :patch], as: :settings

  get 'artists/:slug' => "parties#show"

  resources :interests, path: '/'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


end
