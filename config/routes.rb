Rails.application.routes.draw do
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
  resources :genres
  resources :lyrics
  resources :notes
  resources :parties
  resources :phones
  resources :places
  resources :roles
  resources :series
  resources :series_works
  resources :titles
  resources :tools
  resources :wields
  resources :works


  devise_for :users
  match 'status' => 'admin#status', via: [:get, :post], as: 'status'
  get 'touch/:object_type/:object_id' => 'admin#touch', as: 'touch'
  get 'exception/:id' => "admin#exception", as: :exception

  get 'works/:work_id/tools' => 'works#tools', as: 'work_tools'

  get 'todd-gehman-resume' => 'resume#show', as: :resume
  match 'settings' => 'users#edit', via: [:get, :patch], as: :settings

  get 'artists/:slug' => 'parties#show'

  resources :interests, path: '/'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


end
