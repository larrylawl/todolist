Rails.application.routes.draw do
  resources :tasks
  get "tags/:tag", to: "tasks#index", as: :tag
  root 'tasks#index'
end
