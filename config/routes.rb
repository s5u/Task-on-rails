Rails.application.routes.draw do
  devise_for :users
  root to: "targets#index"
  resources :targets, except: :show do
    resources :tasks do
      resources :todos
    end
  end

  # get 'targets/:id/tasks/new' => 'tasks#new'
  # get 'targets' => 'targets#index'
  # get 'targets/new' => 'targets#new'
  # post 'targets' => 'targets#create'
  # root to: "tasks#index"
end