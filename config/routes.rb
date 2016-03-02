Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'


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

  get 'resume' => 'resume#show', as: :resume
  match 'todd/edit' => 'about#edit', via: [:get, :post], as: :edit_todd
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'about#home'


end
