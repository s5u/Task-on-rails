Rails.application.routes.draw do
  devise_for :users
  resources :targets
  # get 'targets' => 'targets#index'
  # get 'targets/new' => 'targets#new'
  # post 'targets' => 'targets#create'
  # root to: "tasks#index"
end
