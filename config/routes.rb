Rails.application.routes.draw do
  resources :rels
  resources :rel_types
  resources :subjects
  resources :sub_types

  root "subjects#index"

  get '/subjects/set_tree/:id',
    to: 'subjects#set_tree',
    as: 'subjects_set_tree'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
