Rails.application.routes.draw do
  resources :tasks do
  	resources :subtasks
  	patch 'completed', on: :member
  	delete 'destroy_all', on: :collection
  end
  get '/tags/:id', to: 'tags#show', as: 'tag'
  root 'tasks#index'
end
