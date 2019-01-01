Rails.application.routes.draw do
  resources :tasks do
  	resources :subtasks
  	patch 'completed', on: :member
  end
  get "tags/:tag", to: "tasks#index", as: :tag
  root 'tasks#index'
end
